class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]

  def index
    @events = Event.all
  end

  def show
  end

  def edit
  end

  def update
    @event.update(update_params)
    redirect_to @event
  end

  private

  def update_params
    params.require(:event)
      .permit(:name, :description, :location, :price, :starts_at)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
