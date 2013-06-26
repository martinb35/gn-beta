class TasksController < ApplicationController
  skip_before_action :authorize, only: [:new, :create, :show]
  
  def show
    @categories = JobCategory.order(:title)
  end

  def add
  end
end
