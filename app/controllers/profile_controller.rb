class ProfileController < ApplicationController
	skip_authorization_check
  def index
  	if !session[:user_id]
    	@user_session = nil
    else
    	@user_session = session    		
    end
  	@branding = true
  end

  def edit
  	if !session[:user_id]
    	@user_session = nil
    else
    	@user_session = session    		
    end
  	@branding = true
  end
end
