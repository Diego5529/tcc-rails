require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { address: @event.address, archived: @event.archived, city: @event.city, complement: @event.complement, district: @event.district, end_date: @event.end_date, end_hour: @event.end_hour, initial_date: @event.initial_date, initial_hour: @event.initial_hour, long_description: @event.long_description, max_user: @event.max_user, min_user: @event.min_user, name: @event.name, number: @event.number, short_description: @event.short_description, state: @event.state, status: @event.status, zip_code: @event.zip_code }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { address: @event.address, archived: @event.archived, city: @event.city, complement: @event.complement, district: @event.district, end_date: @event.end_date, end_hour: @event.end_hour, initial_date: @event.initial_date, initial_hour: @event.initial_hour, long_description: @event.long_description, max_user: @event.max_user, min_user: @event.min_user, name: @event.name, number: @event.number, short_description: @event.short_description, state: @event.state, status: @event.status, zip_code: @event.zip_code }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
