class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.integer :user_id
      t.integer :lat
      t.integer :lng

      t.timestamps
    end
  end
end
