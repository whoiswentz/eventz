class EventsController < ApplicationController
  def index
    @events = ["Bug Smash", "RubyConf"]
  end
end