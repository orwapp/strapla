class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_current_user

  rescue_from Exception, :with => :error_render_method

  if Rails.env.production?
    http_basic_authenticate_with name: ENV['HTTP_USERNAME'] || 'funky_admin' , password: ENV['HTTP_PASSWORD'] || 'top_secret'
  end
  
  def keep_alive
    render :nothing => true
  end

  def find_requests
    if user_signed_in?
      @unassigned_requests     = Request.published_and_unassigned.where("user_id != #{@current_user.id}")
      @my_requests_unassigned  = current_user.requests.published_and_unassigned.to_a
      @my_requests_in_progress = current_user.requests.in_process.to_a
      @my_requests_assigned_not_accepted = current_user.requests.assigned_not_accepted.to_a
    else
      @unassigned_requests = Request.published_and_unassigned
    end
    @groups = @unassigned_requests.load.collect(&:request_group).uniq if @unassigned_requests
  end


  def error_render_method
    respond_to do |type|
      #type.html { render :template => "errors/error_404", :status => 404 }
      type.html { redirect_to root_path, notice: 'Could not find that, please start looking from here.' }
      type.all  { render :nothing => true, :status => 404 }
    end
    true
  end


  protected

  def set_current_user
    @current_user ||= current_user if user_signed_in?
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| 
      u.permit(:password, :password_confirmation, :current_password, :email, :phone, :bio, :image_url, :name, :linkedin_url) }
    devise_parameter_sanitizer.for(:sign_up) { |u| 
      u.permit(:password, :password_confirmation, :current_password, :email, :phone, :bio, :image_url, :name, :linkedin_url) }
  end
end
