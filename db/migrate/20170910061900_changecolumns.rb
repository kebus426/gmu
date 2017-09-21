class Changecolumns < ActiveRecord::Migration[5.1]
  def change
    change_column :musics, :user_name, :string, null: false
    change_column :musics, :original_filename, :string, null: false
    change_column :musics, :file_name, :text, null: false
  end
end
