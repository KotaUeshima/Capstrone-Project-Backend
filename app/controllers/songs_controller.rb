class SongsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create]

    def index
        render json: Song.all
    end

    def create
        song = Song.create(song_params)
        render json: song, status: :created
    end

    private

    def song_params
        params.permit(:title, :artist, :user_id, :lat, :lng)
    end
end
