require 'rails_admin/config/actions'
module RailsAdmin
  module Config
    module Actions
      class EditModel < Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :object_level do
          false
        end

        register_instance_option :pjax? do
          true
        end

        register_instance_option :member? do
          false
        end

        register_instance_option :collection? do
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
            if request.method.downcase.in?(%w(post patch put))
              resource_params = params[:product]

              resource_params.each do |prop_key, prop_value|

                option_id = prop_value.to_i

                resource = @object
                resource.assign_prop(option_id)

              end

            else
              @model_info = ModelInfo.find(@model_name)
            end

            render "edit_model"

          end
        end


      end
    end
  end
end
