class AddUseridAndMusicidToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :user_id, :int
    add_column :favorites, :music_id, :int
  end
end
