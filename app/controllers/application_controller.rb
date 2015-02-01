class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale
  # check_authorization
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options(options = {})
    {locale: I18n.locale}
  end


private
  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email,:password,:password_confirmation) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :password,:remember_me,:login) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :avatar) }
  end

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end
  # def current_user
  #   true
  # end

end
