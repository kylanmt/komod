class EventsController < ApplicationController
  def index
    @event = Event.last
  end

  def show
  end

  def create
  end
end
