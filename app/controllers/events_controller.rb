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
    binding.pry
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :genre_id, :date, :description, user_ids: [])
  end

end
