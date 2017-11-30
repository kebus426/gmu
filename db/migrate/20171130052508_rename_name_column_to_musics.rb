class RenameNameColumnToMusics < ActiveRecord::Migration[5.1]
  def change
    rename_column :musics, :name, :music_name
  end
end
