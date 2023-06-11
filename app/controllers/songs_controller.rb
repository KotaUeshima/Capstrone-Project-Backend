class SongsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :show, :top_five]

    # GET /songs
    def index
        render json: Song.all
    end

    # showing songs by User I not Song Id
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

    # TOP_FIVE
    def top_five
        songs = Song.group(:title, :artist, :image_url).limit(5).order(Arel.sql('COUNT(title) DESC')).pluck(:title, :artist, :image_url, Arel.sql('COUNT(title)'))
        render json: songs, status: :ok
    end

    private

    def song_params
        params.permit(:title, :artist, :user_id, :lat, :lng, :image_url, :spotify_url)
    end
end
