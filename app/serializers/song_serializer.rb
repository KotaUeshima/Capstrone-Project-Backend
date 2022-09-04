class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :user_id, :lat, :lng, :image_url, :spotify_url
  belongs_to :user
end
