class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  check_authorization
  
  before_action :authorize
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to tasks_url, :alert => exception.message
  end
  
  protected
    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
end
