class TasksController < ApplicationController
  before_action :define_event, exept: :destroy
  def index
    @tasks = @event.tasks
  end



  def show
    @task = Task.find(params[:id])
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :deadline, :user_id).merge(event_id: params[:event_id])
  end

  def define_event
    @event = Event.find(params[:event_id])
  end
end
