class EventsController < ApplicationController
  def index
    @events = Event.all
    @userevents = UserEvent.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @userevents = UserEvent.all
  end

  def destroy
    @event = Event.find(params[:id])
    @userevents = UserEvent.find(params[:id])
    redirect_to root_path unless current_user.id != @userevents.user.id
    @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :genre_id, :date, :description, user_ids: [])
  end

end
