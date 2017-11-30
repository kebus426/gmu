class AddFileToMusics < ActiveRecord::Migration[5.1]
  def change
    add_column :musics, :file, :string
  end
end
