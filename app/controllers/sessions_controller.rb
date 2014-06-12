class SessionsController < ApplicationController
  skip_authorization_check
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.name
      session[:user_email] = user.email
      redirect_to jobs_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to tasks_url
  end
end
