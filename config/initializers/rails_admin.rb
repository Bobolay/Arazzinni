require_relative 'require_lib'
#require_relative '../../app/models/rails_admin_dynamic_config'
#require_relative '../../app/models/my_class'

DynamicModelGenerator.load

RailsAdminDynamicConfig.configure_rails_admin

def js_field(name)
  field name, :code_mirror do
    theme = "night" # night
    mode = 'javascript'

    assets do
      {
          mode: "/assets/codemirror/modes/#{mode}.js",
          theme: "/assets/codemirror/themes/#{theme}.css"
      }
    end

    config do
      {
          mode: mode,
          theme: theme
      }
    end
  end
end
