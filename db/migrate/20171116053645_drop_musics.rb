class DropMusics < ActiveRecord::Migration[5.1]
  def change
    drop_table :musics
  end
end
