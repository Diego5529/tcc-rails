class Api::Event::EventController < ApplicationController

  def index
    events = Event.all
    render json: { events: events }
  end

  def show
    event = Event.find(params[:id])
    render json: { event: event }
  end

  def events_by_user
    @a = []

    user = User.find_by_email(params[:email])

    if user
      events_by_user = user.user_company_types.map { |u| u.company.events }.shift.compact
      render json: { events_by_user: events_by_user }
    else
      render json: {message: 'User not found.'}
    end
  end
end