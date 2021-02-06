class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    redirect_to @event if @event.update(event_params)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    redirect_to @event if @event.save
  end

  def destroy
    @event = Event.find(params[:id])
    redirect_to events_url if @event.destroy
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :location, :price, :starts_at)
  end
end