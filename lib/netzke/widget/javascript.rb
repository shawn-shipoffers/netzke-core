module Netzke
  module Widget
    # == Widget javascript code
    # Here's a brief explanation on how a javascript class for a widget gets built.
    # Widget gets defined as a constructor (a function) by +js_class+ class method (see "Inside widget's contstructor").
    # +Ext.extend+ provides inheritance from an Ext class specified in +js_base_class+ class method.
    # 
    # == Inside widget's constructor
    # * Widget's constructor gets called with a parameter that is a configuration object provided by +js_config+ instance method. This configuration is specific for the instance of the widget, and, for example, contains this widget's unique id. As another example, by means of this configuration object, a grid receives the configuration array for its columns, a form - for its fields, etc. With other words, everything that may change from instance to instance of the same widget's class, goes in here.
    #
    module Javascript
      module ClassMethods
        # the JS (Ext) class that we inherit from on JS-level
        def js_base_class
          "Ext.Panel"
        end

        # Properties (including methods) that will be used to extend the functionality of (Ext) JS-class specified in js_base_class
        def js_properties 
          {}
        end

        # Chaining alias methods at JavaScript level (used when mixing in JavaScript "modules")
        def js_alias_method_chain(target, feature)
          write_inheritable_attribute(:js_before_constructor, (read_inheritable_attribute(:js_before_constructor) || "") << <<-END_OF_JAVASCRIPT)
this.aliasMethodChain("#{target.to_s.camelize(:lower)}", "#{feature.to_s.camelize(:lower)}");
          END_OF_JAVASCRIPT
        end

        # widget's menus
        # def js_menus; []; end

        # Given class name, e.g. GridPanelLib::Widgets::RecordFormWindow, 
        # returns its scope: "Widgets.RecordFormWindow"
        def js_class_name_to_scope(name)
          name.split("::")[0..-2].join(".")
        end

        # Top level scope which will be used to scope out Netzke classes
        def js_default_scope
          "Netzke.classes"
        end

        # Scope of this widget without default scope
        # e.g.: GridPanelLib.Widgets
        def js_scope
          js_class_name_to_scope(short_widget_class_name)
        end

        # Returns the scope of this widget
        # e.g. "Netzke.classes.GridPanelLib"
        def js_full_scope
          js_scope.empty? ? js_default_scope : [js_default_scope, js_scope].join(".")
        end

        # Returns the name of the JavaScript class for this widget, including the scope
        # e.g.: "GridPanelLib.RecordFormWindow"
        def js_scoped_class_name
          short_widget_class_name.gsub("::", ".")
        end

        # Returns the full name of the JavaScript class, including the scopes *and* the common scope, which is
        # Netzke.classes.
        # E.g.: "Netzke.classes.Netzke.GridPanelLib.RecordFormWindow"
        def js_full_class_name
          [js_full_scope, short_widget_class_name.split("::").last].join(".")
        end

        # Builds this widget's xtype
        # E.g.: netzkewindow, netzkegridpanel
        def js_xtype
          name.gsub("::", "").downcase
        end

        # are we using JS inheritance? for now, if js_base_class is a Netzke class - yes
        def js_inheritance?
          superclass != Netzke::Widget::Base
        end

        # Declaration of widget's class (stored in the cache storage (Ext.netzke.cache) at the client side 
        # to be reused at the moment of widget instantiation)
        def js_class(cached = [])
          # Defining the scope if it isn't known yet
          res = js_full_scope == js_default_scope ? "" : %Q{
          Ext.ns("#{js_full_scope}");
          }

          if js_inheritance?
            # Using javascript inheritance
  #           res << <<-END_OF_JAVASCRIPT
  #           // Costructor
  # #{js_full_class_name} = function(config){
  #   #{js_full_class_name}.superclass.constructor.call(this, config);
  # };
  #           END_OF_JAVASCRIPT

            # Do we specify our own extend properties (overriding js_properties)? 
            # If so, include them, if not - don't re-include those from the parent.
            res << (singleton_methods(false).include?(:js_properties) ? %Q{
  #{js_full_class_name} = Ext.extend(#{superclass.js_full_class_name}, #{js_properties.to_nifty_json});
            } : %Q{
  #{js_full_class_name} = Ext.extend(#{superclass.js_full_class_name}, {});
            })

            res << <<-END_OF_JAVASCRIPT
            
            // Register our xtype
            Ext.reg("#{js_xtype}", #{js_full_class_name});
            END_OF_JAVASCRIPT

          else
            res << <<-END_OF_JAVASCRIPT
// Constructor
        #{js_full_class_name} = function(config){
          #{read_inheritable_attribute(:js_before_constructor)}
          #{js_full_class_name}.superclass.constructor.call(this, config);
        };
        
        Ext.extend(#{js_full_class_name}, #{js_base_class}, Ext.applyIf(#{js_properties.to_nifty_json}, Ext.widgetMixIn(#{js_base_class})));
        
        // Register xtype
        Ext.reg("#{js_xtype}", #{js_full_class_name});
            END_OF_JAVASCRIPT
          end

          res
        end
        
        
        def js_extra_code
          ""
        end
        
        # Returns all extra JavaScript-code (as string) required by this widget's class
        def js_included
          res = ""

          # Prevent re-including code that was already included by the parent
          # (thus, only include those JS files when include_js was defined in the current class, not in its ancestors)
          singleton_methods(false).include?(:include_js) && include_js.each do |path|
            f = File.new(path)
            res << f.read << "\n"
          end

          res
        end

        def include_js
          []
        end

        # All JavaScript code needed for this class, including one from the ancestor widget
        def js_code(cached = [])
          res = ""

          # include the base-class javascript if doing JS inheritance
          if js_inheritance? && !cached.include?(superclass.short_widget_class_name)
            res << superclass.js_code(cached) << "\n"
          end

          # include static javascripts
          res << js_included << "\n"

          # our own JS class definition
          res << js_class(cached)
          res
        end
        
        # Little helper
        def this; "this".l; end

        # Little helper
        def null; "null".l; end

        
      end
      
      module InstanceMethods
        # Config that is used for instantiating the widget in javascript
        def js_config
          res = {}

          # Unique id of the widget
          res.merge!(:id => global_id)

          # Recursively include configs of all non-late aggregatees, so that the widget can instantiate them
          # in javascript immediately.
          # non_late_aggregatees.each_pair do |aggr_name, aggr_config|
          #   aggr_instance = aggregatee_instance(aggr_name.to_sym)
          #   aggr_instance.before_load
          #   res[:"#{aggr_name}_config"] = aggr_instance.js_config
          # end
          
          # Non-late aggregatees
          aggr_hash = {}
          
          non_late_aggregatees.each_pair do |aggr_name, aggr_config|
            aggr_instance = aggregatee_instance(aggr_name.to_sym)
            aggr_instance.before_load
            aggr_hash[aggr_name] = aggr_instance.js_config
          end
          
          res[:aggregatees] = aggr_hash unless aggr_hash.empty?


          # Api (besides the default "load_aggregatee_with_cache" - JavaScript side already knows about it)
          api_points = self.class.api_points.reject{ |p| p == :load_aggregatee_with_cache }
          res.merge!(:netzke_api => api_points) unless api_points.empty?

          # Widget class name. Needed for dynamic instantiation in javascript.
          res.merge!(:scoped_class_name => self.class.js_scoped_class_name)

          # Inform the JavaScript side if persistent_config is enabled
          # res[:persistent_config] = persistent_config_enabled?

          # Include our xtype
          res[:xtype] = self.class.js_xtype

          # Merge with the rest of config options, besides those that are only meant for the server side
          res.merge!(config.reject{ |k,v| self.class.server_side_config_options.include?(k.to_sym) })

          res
        end

        # All the JS-code required by this instance of the widget to be instantiated in the browser.
        # It includes the JS-class for the widget itself, as well as JS-classes for all widgets' (non-late) aggregatees.
        def js_missing_code(cached = [])
          code = dependency_classes.inject("") do |r,k| 
            cached.include?(k) ? r : r + "Netzke::#{k}".constantize.js_code(cached)#.strip_js_comments
          end
          code.blank? ? nil : code
        end
        
      end
      
      def self.included(receiver)
        receiver.extend         ClassMethods
        receiver.send :include, InstanceMethods
        
        # Overriding Ext.Component#initComponent in core.js
        receiver.js_alias_method_chain :init_component, :netzke
      end
    end
  end
end