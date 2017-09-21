class CreateMusics < ActiveRecord::Migration[5.1]
  def change
    create_table :musics do |t|
      t.string :user_name 
      t.string :original_filename
      t.text   :file_name
      t.timestamps
    end
  end
end
