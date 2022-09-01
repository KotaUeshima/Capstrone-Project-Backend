class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :user_id, :lat, :lng
end
