class ChangeLatAndLngToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :songs, :lat, :float
    change_column :songs, :lng, :float
  end
end
