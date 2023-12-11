class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to @event
  end

  def index
    @events = Event.all
  end

  def show
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to @event
  end

  private

  def event_params
    params.require(:event)
      .permit(:name, :description, :location, :price, :starts_at)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
