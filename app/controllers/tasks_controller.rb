class TasksController < ApplicationController
  before_action :define_event

  def index
    @tasks = @event.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.event = @event
    @task.users = User.find(params[:user_ids])
    if @task.valid?
      @task.save
      redirect_to event_tasks_path(@event)
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.users = User.find(params[:user_ids])
    if @task.valid?
      @task.update(task_params)
      redirect_to event_tasks_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to event_tasks_path(@event)
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :deadline, :event_id, user_ids: [])
  end

  def define_event
    @event = Event.find(params[:event_id])
  end
end
