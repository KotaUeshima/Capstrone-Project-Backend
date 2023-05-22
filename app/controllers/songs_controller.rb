class SongsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :show]

    # GET /songs
    def index
        render json: Song.all
    end

    # GET /songs/:id
    def show
        user = User.find(params[:id])
        songs = user.songs
        render json: songs.reverse
    end

    # POST /songs
    def create
        song = Song.create(song_params)
        render json: song, status: :created
    end

    private

    def song_params
        params.permit(:title, :artist, :user_id, :lat, :lng, :image_url, :spotify_url)
    end
end
