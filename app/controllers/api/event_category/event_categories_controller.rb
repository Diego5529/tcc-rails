class Api::EventCategory::EventCategoriesController < ApplicationController

  def index
    event_categories = EventCategory.all
    render json: { event_categories: event_categories }
  end

  def show
    event_category = EventCategory.find(params[:id])
    render json: { event_category: event_category }
  end
end