class TasksController < ApplicationController
  def show
    @categories = JobCategory.order(:title)
  end

  def add
  end
end
