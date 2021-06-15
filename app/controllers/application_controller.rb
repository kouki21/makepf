class ApplicationController < ActionController::Base

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
  end

  def after_sign_in_path_for(resource)
    user_path(id: current_user)
  end

  def after_sign_up_path_for(resource)
    user_path(id: current_user)
  end

end
