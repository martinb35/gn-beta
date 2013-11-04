class TasksController < ApplicationController
  skip_before_action :authorize, only: [:new, :create, :show]
  skip_authorization_check
  
  def show
    @categories = JobCategory.order(:title)
  end
end
