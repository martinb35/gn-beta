class ThankController < ApplicationController
  skip_authorization_check
  def index
  	@user = User.find(session[:user_id])
  end
end
