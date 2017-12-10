class Api::Event::EventController < ApplicationController

  def index
    events = Event.all
    render json: { events: events }
  end

  def show
    event = Event.find(params[:id])
    render json: { event: event }
  end

  def update
    @event = Event.find_by_id(params[:event][:id])
    event = @event.update(update_params)
    if event
      head :ok
    else
      render json: event.errors.full_messages, status: :unprocessable_entity
    end
  end

  def create
    @event = Event.new(create_params)
    if @event.save
      render json: @event, status: :created, root: :event
    else
      render json: @event.errors.full_messages
    end
  end

  private
  def create_params
    params.require(:event).permit(:title, :short_description, :long_description, :initial_date, :end_date, :initial_hour, :end_hour, :min_users, :max_users, :company_id)
  end

  def update_params
    params.require(:event).permit(:title, :short_description, :long_description, :initial_date, :end_date, :initial_hour, :end_hour, :min_users, :max_users, :company_id)
  end
end