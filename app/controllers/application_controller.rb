class ApplicationController < ActionController::Base
  before_action :configure_permitted_params, if: :devise_controller?

  protected

  def after_sign_in_path_for(user)
    if current_user.admin?
      admin_tests_path
    else
      root_path
    end
  end

  def configure_permitted_params
    permitted_params = %i(first_name last_name)

    devise_parameter_sanitizer.permit(:sign_up, keys: permitted_params)
  end
end
