class AddIndexToMusicname < ActiveRecord::Migration[5.1]
  def change
        add_index :musics, :music_name, unique: true
  end
end
