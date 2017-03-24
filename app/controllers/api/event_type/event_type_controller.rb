class Api::EventType::EventTypeController < ApplicationController

  def index
    event_types = EventType.all
    render json: { event_types: event_types }
  end

  def show
    event_type = EventType.find(params[:id])
    render json: { event_type: event_type }
  end
end