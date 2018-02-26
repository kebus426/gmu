class AddArtworkToMusics < ActiveRecord::Migration[5.1]
  def change
    add_column :musics, :artwork, :string
  end
end
