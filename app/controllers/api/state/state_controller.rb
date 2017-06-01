class Api::State::StateController < ApplicationController

  def index
    states = State.all
    render json: { states: states }
  end

  def show
    state = State.find(params[:id])
    render json: { state: state }
  end
end