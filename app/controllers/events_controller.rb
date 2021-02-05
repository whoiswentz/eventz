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
    redirect_to @event if @event.update(update_params)
  end

  private
  def update_params
    params.require(:event).permit(:name, :description, :location, :price, :starts_at)
  end
end