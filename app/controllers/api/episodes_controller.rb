module Api
  class EpisodesController < ApplicationController
    def index
      @episodes = Episode.all
      render json: @episodes, status: 200
    end

  def create
    episode = Episode.new(episode_params)
    if episode.save
      render json: episode, status: 201, location: episode
    end
  end

  def update
    episode = Episode.find(params[:id])
    if episode.update(episode_params)
      render json: episode, status: 200
    else
      render json: episode.errors, status: 422
    end
 end

  def show
    episode = Episode.find_by_id params[:id]
    p episode, '----', params
    if episode
      render json: episode, status: 200
    else
      render json: [error: 'Teste'], status: 404
    end
  end

  def destroy
    episode = Episode.find_by_id params[:id]
    if episode
      p episode, '**************'
      episode = episode.find_unarchived(params[:id])
      if episode.archive
        render json: [feedback: 'Archived'], status: 204
      else
        render json: [error: 'Error on archive episode.'], status: 204
      end
    else
      render json: [error: 'episode not found.'], status: 200
    end
 end

  private
    def episode_params
      params.require(:episode).permit(:first_name, :description, :email, :password_digest)
    end
  end
end