class AddExternalUriToSong < ActiveRecord::Migration[7.0]
  def change
    add_column :songs, :spotify_url, :string
  end
end
