class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :gender_id, :hobby, :comment, :age, :prefecture_id, :city, :address])
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

end
