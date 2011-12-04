# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{netzke-core}
  s.version = "0.7.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{NomadCoder}]
  s.date = %q{2011-12-04}
  s.description = %q{Allows building DRY ExtJS/Rails applications by enabling modular development}
  s.email = %q{nmcoder@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    ".autotest",
    "CHANGELOG.rdoc",
    "LICENSE",
    "Manifest",
    "README.md",
    "Rakefile",
    "TODO.md",
    "app/controllers/netzke_controller.rb",
    "init.rb",
    "install.rb",
    "javascripts/base.js",
    "javascripts/core_extensions.js",
    "javascripts/ext.js",
    "javascripts/touch.js",
    "lib/netzke-core.rb",
    "lib/netzke/actions.rb",
    "lib/netzke/base.rb",
    "lib/netzke/composition.rb",
    "lib/netzke/config_to_dsl_delegator.rb",
    "lib/netzke/configuration.rb",
    "lib/netzke/core.rb",
    "lib/netzke/core/dynamic_assets.rb",
    "lib/netzke/core/masquerading.rb",
    "lib/netzke/core/options_hash.rb",
    "lib/netzke/core/session.rb",
    "lib/netzke/core/version.rb",
    "lib/netzke/core_ext.rb",
    "lib/netzke/core_ext/array.rb",
    "lib/netzke/core_ext/hash.rb",
    "lib/netzke/core_ext/string.rb",
    "lib/netzke/core_ext/symbol.rb",
    "lib/netzke/core_ext/time_with_zone.rb",
    "lib/netzke/embedding.rb",
    "lib/netzke/ext_component.rb",
    "lib/netzke/inheritance.rb",
    "lib/netzke/javascript.rb",
    "lib/netzke/javascript/scopes.rb",
    "lib/netzke/plugin.rb",
    "lib/netzke/plugins.rb",
    "lib/netzke/railz.rb",
    "lib/netzke/railz/action_view_ext.rb",
    "lib/netzke/railz/action_view_ext/ext.rb",
    "lib/netzke/railz/action_view_ext/touch.rb",
    "lib/netzke/railz/controller_extensions.rb",
    "lib/netzke/railz/engine.rb",
    "lib/netzke/railz/routes.rb",
    "lib/netzke/services.rb",
    "lib/netzke/session.rb",
    "lib/netzke/state.rb",
    "lib/netzke/stylesheets.rb",
    "lib/tasks/netzke_core_tasks.rake",
    "netzke-core.gemspec",
    "stylesheets/core.css",
    "test/core_test_app/.gitignore",
    "test/core_test_app/.rvmrc",
    "test/core_test_app/Gemfile",
    "test/core_test_app/Gemfile.lock",
    "test/core_test_app/README",
    "test/core_test_app/Rakefile",
    "test/core_test_app/app/components/border_layout_panel.rb",
    "test/core_test_app/app/components/card_component_loader.rb",
    "test/core_test_app/app/components/component_loader.rb",
    "test/core_test_app/app/components/component_with_actions.rb",
    "test/core_test_app/app/components/component_with_custom_css.rb",
    "test/core_test_app/app/components/component_with_custom_css/stylesheets/custom.css",
    "test/core_test_app/app/components/component_with_included_js.rb",
    "test/core_test_app/app/components/component_with_js_mixin.rb",
    "test/core_test_app/app/components/component_with_js_mixin/javascripts/component_with_js_mixin.js",
    "test/core_test_app/app/components/component_with_js_mixin/javascripts/extra_one.js",
    "test/core_test_app/app/components/component_with_js_mixin/javascripts/extra_two.js",
    "test/core_test_app/app/components/component_with_js_mixin/javascripts/method_set_one.js",
    "test/core_test_app/app/components/component_with_js_mixin/javascripts/method_set_two.js",
    "test/core_test_app/app/components/component_with_nested_through.rb",
    "test/core_test_app/app/components/component_with_session_persistence.rb",
    "test/core_test_app/app/components/deprecated/server_caller.rb",
    "test/core_test_app/app/components/dynamic_tab_panel.rb",
    "test/core_test_app/app/components/dynamic_tab_panel/javascripts/dynamic_tab_panel.js",
    "test/core_test_app/app/components/ext_direct/composite.rb",
    "test/core_test_app/app/components/ext_direct/details.rb",
    "test/core_test_app/app/components/ext_direct/selector.rb",
    "test/core_test_app/app/components/ext_direct/statistics.rb",
    "test/core_test_app/app/components/extended_component_with_actions.rb",
    "test/core_test_app/app/components/extended_component_with_js_mixin.rb",
    "test/core_test_app/app/components/extended_component_with_js_mixin/javascripts/some_method_set.js",
    "test/core_test_app/app/components/extended_localized_panel.rb",
    "test/core_test_app/app/components/extended_server_caller.rb",
    "test/core_test_app/app/components/hello_world_component.rb",
    "test/core_test_app/app/components/included.js",
    "test/core_test_app/app/components/inline_composite.rb",
    "test/core_test_app/app/components/kinda_complex_component.rb",
    "test/core_test_app/app/components/kinda_complex_component/basic_stuff.rb",
    "test/core_test_app/app/components/kinda_complex_component/extra_stuff.rb",
    "test/core_test_app/app/components/loader_of_component_with_custom_css.rb",
    "test/core_test_app/app/components/localized_panel.rb",
    "test/core_test_app/app/components/multipane_component_loader.rb",
    "test/core_test_app/app/components/nested_component.rb",
    "test/core_test_app/app/components/panel_with_plugin.rb",
    "test/core_test_app/app/components/panel_with_tools.rb",
    "test/core_test_app/app/components/plugin_with_components.rb",
    "test/core_test_app/app/components/scoped_components/deep_scoped_components/some_deep_scoped_component.rb",
    "test/core_test_app/app/components/scoped_components/extended_scoped_component.rb",
    "test/core_test_app/app/components/scoped_components/some_scoped_component.rb",
    "test/core_test_app/app/components/server_caller.rb",
    "test/core_test_app/app/components/server_counter.rb",
    "test/core_test_app/app/components/simple_component.rb",
    "test/core_test_app/app/components/simple_panel.rb",
    "test/core_test_app/app/components/simple_tab_panel.rb",
    "test/core_test_app/app/components/simple_window.rb",
    "test/core_test_app/app/components/some_composite.rb",
    "test/core_test_app/app/components/some_ext_component.rb",
    "test/core_test_app/app/components/some_plugin.rb",
    "test/core_test_app/app/components/touch/hello_world_component.rb",
    "test/core_test_app/app/components/touch/server_caller.rb",
    "test/core_test_app/app/components/touch/simple_carousel.rb",
    "test/core_test_app/app/controllers/application_controller.rb",
    "test/core_test_app/app/controllers/components_controller.rb",
    "test/core_test_app/app/controllers/simple_rails_controller.rb",
    "test/core_test_app/app/controllers/touch_controller.rb",
    "test/core_test_app/app/controllers/welcome_controller.rb",
    "test/core_test_app/app/helpers/application_helper.rb",
    "test/core_test_app/app/helpers/touch_helper.rb",
    "test/core_test_app/app/views/components/panel_with_autoload.html.erb",
    "test/core_test_app/app/views/components/some_tab_panel.html.erb",
    "test/core_test_app/app/views/layouts/application.html.erb",
    "test/core_test_app/app/views/layouts/nested.html.erb",
    "test/core_test_app/app/views/layouts/touch.html.erb",
    "test/core_test_app/app/views/simple_rails/multiple_nested.html.erb",
    "test/core_test_app/app/views/simple_rails/multiple_of_different_class.html.erb",
    "test/core_test_app/app/views/simple_rails/multiple_of_same_class.html.erb",
    "test/core_test_app/config.ru",
    "test/core_test_app/config/application.rb",
    "test/core_test_app/config/boot.rb",
    "test/core_test_app/config/database.yml",
    "test/core_test_app/config/environment.rb",
    "test/core_test_app/config/environments/development.rb",
    "test/core_test_app/config/environments/production.rb",
    "test/core_test_app/config/environments/test.rb",
    "test/core_test_app/config/initializers/backtrace_silencers.rb",
    "test/core_test_app/config/initializers/inflections.rb",
    "test/core_test_app/config/initializers/mime_types.rb",
    "test/core_test_app/config/initializers/netzke.rb",
    "test/core_test_app/config/initializers/secret_token.rb",
    "test/core_test_app/config/initializers/session_store.rb",
    "test/core_test_app/config/locales/en.yml",
    "test/core_test_app/config/locales/es.yml",
    "test/core_test_app/config/routes.rb",
    "test/core_test_app/db/development_structure.sql",
    "test/core_test_app/db/migrate/20110110132720_create_netzke_component_states.rb",
    "test/core_test_app/db/schema.rb",
    "test/core_test_app/db/seeds.rb",
    "test/core_test_app/features/actions_and_tools.feature",
    "test/core_test_app/features/basic.feature",
    "test/core_test_app/features/client-server.feature",
    "test/core_test_app/features/complex_component.feature",
    "test/core_test_app/features/component.feature",
    "test/core_test_app/features/component_loader.feature",
    "test/core_test_app/features/composition.feature",
    "test/core_test_app/features/custom_css.feature",
    "test/core_test_app/features/ext.direct.feature",
    "test/core_test_app/features/file_inclusion.feature",
    "test/core_test_app/features/i18n.feature",
    "test/core_test_app/features/inheritance.feature",
    "test/core_test_app/features/js_include.feature",
    "test/core_test_app/features/nested_views.feature",
    "test/core_test_app/features/persistence.feature",
    "test/core_test_app/features/plugin.feature",
    "test/core_test_app/features/rails_views.feature",
    "test/core_test_app/features/scopes.feature",
    "test/core_test_app/features/step_definitions/custom_css_steps.rb",
    "test/core_test_app/features/step_definitions/generic_steps.rb",
    "test/core_test_app/features/step_definitions/touch_steps.rb",
    "test/core_test_app/features/step_definitions/web_steps.rb",
    "test/core_test_app/features/support/env.rb",
    "test/core_test_app/features/support/paths.rb",
    "test/core_test_app/features/touch.feature",
    "test/core_test_app/lib/tasks/.gitkeep",
    "test/core_test_app/public/404.html",
    "test/core_test_app/public/422.html",
    "test/core_test_app/public/500.html",
    "test/core_test_app/public/favicon.ico",
    "test/core_test_app/public/images/rails.png",
    "test/core_test_app/public/robots.txt",
    "test/core_test_app/script/rails",
    "test/core_test_app/spec/component/actions_spec.rb",
    "test/core_test_app/spec/component/base_spec.rb",
    "test/core_test_app/spec/component/component_spec.rb",
    "test/core_test_app/spec/component/composition_spec.rb",
    "test/core_test_app/spec/component/configuration_spec.rb",
    "test/core_test_app/spec/component/javascript_spec.rb",
    "test/core_test_app/spec/component/state_spec.rb",
    "test/core_test_app/spec/core_ext_spec.rb",
    "test/core_test_app/spec/spec.opt",
    "test/core_test_app/spec/spec_helper.rb",
    "test/core_test_app/tmp/restart.txt",
    "test/core_test_app/vendor/plugins/.gitkeep",
    "test/fixtures/roles.yml",
    "test/fixtures/users.yml",
    "test/test_helper.rb",
    "test/unit/core_ext_test.rb",
    "test/unit/netzke_core_test.rb",
    "test/unit/netzke_preference_test.rb",
    "uninstall.rb"
  ]
  s.homepage = %q{http://netzke.org}
  s.post_install_message = %q{
==========================================================

           Thanks for installing netzke-core!

  Home page:     http://netzke.org
  Google Groups: http://groups.google.com/group/netzke
  News:          http://twitter.com/netzke
  Tutorials:     http://blog.writelesscode.com

==========================================================

}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Build ExtJS/Rails components with minimum effort}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0.0"])
    else
      s.add_dependency(%q<activesupport>, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 3.0.0"])
  end
end

