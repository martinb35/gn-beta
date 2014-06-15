class TasksController < ApplicationController
  skip_before_action :authorize, only: [:new, :create, :show]
  skip_authorization_check
  
  def show
    @branding = true
    @service = Service.order(:title)
    @job_category = JobCategory.where(title: 'Otras tareas').first
    if !session[:user_id]
    	@user_session = nil
    else
    	@user_session = session    		
    end
  end
end
