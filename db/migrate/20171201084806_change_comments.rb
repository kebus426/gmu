class ChangeComments < ActiveRecord::Migration[5.1]
  def change
      add_reference :comments, :music, foreign_key: true
      add_reference :comments, :user, foreign_key: true
      add_index :comments, [:id, :created_at]

  end
end
