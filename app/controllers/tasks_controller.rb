class TasksController < ApplicationController
  def index
    @tasks = Tasks.all
  end

  def new
    @task = Task.new
  end
end
