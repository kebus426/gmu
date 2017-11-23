class CreateMusics < ActiveRecord::Migration[5.1]
  def change
    create_table :musics do |t|
      t.string :name
      t.text :caption
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
