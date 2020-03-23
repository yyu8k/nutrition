class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  protected
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :first_name_kana, :last_name, :last_name_kana, :phone_number, :birthday, :gender, :height, :weight])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :first_name_kana, :last_name, :last_name_kana, :phone_number, :gender, :height, :weight])
  end

end
