class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_current_user
  before_filter :authenticate_user!

  if Rails.env.production?
    http_basic_authenticate_with name: ENV['HTTP_USERNAME'] || 'funky_admin' , password: ENV['HTTP_PASSWORD'] || 'top_secret'
  end
  


  protected

  def set_current_user
    @current_user ||= current_user if user_signed_in?
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:password, :password_confirmation, :current_password, :email, :phone, :bio, :image_url, :name) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:password, :password_confirmation, :current_password, :email, :phone, :bio, :image_url, :name) }
  end
end
