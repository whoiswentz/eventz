class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: "Event successfully created!!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @events = Event.upcoming
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event successfully updated!!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, status: :see_other, notice: "Event successfully deleted!!"
  end

  private

  def event_params
    params.require(:event)
      .permit(:name, :description, :location, :price, :starts_at, :capacity, :image_file_name)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
