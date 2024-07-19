class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    if resource.save
      if resource.active_for_authentication?
        resource.send_confirmation_instructions if resource.respond_to?(:send_confirmation_instructions)
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        respond_with resource, location: after_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end
end