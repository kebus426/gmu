class Addtimecolmuns < ActiveRecord::Migration[5.1]
  def change
    add_column :musics, :upload_date, :datetime, null: false, default: DateTime.new 
  end
end
