require 'rails_admin_props/engine'
module RailsAdminProps
end

require 'rails_admin/config/actions'
module RailsAdmin
  module Config
    module Actions
      class Props < Base
        RailsAdmin::Config::Actions.register("props", self)

        register_instance_option :object_level do
          true
        end

        register_instance_option :pjax? do
          true
        end

        register_instance_option :root? do
          false
        end

        register_instance_option :collection? do
          false
        end

        register_instance_option :member? do
          true
        end

        register_instance_option :authorized? do
          true
        end

        register_instance_option :visible? do
          true
        end

        register_instance_option :link_icon do
          'icon-move fa fa-file-text-o'
        end

        register_instance_option :http_methods do
          [:get, :post, :patch, :put]
        end

        register_instance_option :controller do
          Proc.new do |klass|
            def visible_fields
              []
            end

            klass.class.helper_method :fields

            if request.method.downcase.in?(%w(post patch put))
              resource_params = params[:product]

              @object.properties = resource_params.to_json
              @object.save
              # resource_params.each do |prop_key, prop_value|
              #
              #   option_id = prop_value.to_i
              #
              #   resource = @object
              #   #resource.assign_prop(option_id)
              #
              #
              # end

            else

            end

            render "props"

          end
        end


      end
    end
  end
end
