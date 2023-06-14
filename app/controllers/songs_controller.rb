class SongsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :show, :destroy, :top_five]

    # GET /songs
    def index
        render json: Song.all
    end

    # GET /songs/:id
    def show
        @song = Song.find(params[:id])
        render json: @song
    end

    # POST /songs
    def create
        song = Song.create(song_params)
        render json: song, status: :created
    end

    # DELETE /songs/:id
    def destroy
        @song = Song.find(params[:id])
        if @song
            @song.destroy
            render json: {message: "Succesfully deleted song", status: :ok}
        else
            render json: {message: "User does not exist", status: :bad_request}
        end
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
