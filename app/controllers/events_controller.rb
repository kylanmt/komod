class EventsController < ApplicationController

  def index
    @articles = Newsletter.all
  end

  def create
  end
end
