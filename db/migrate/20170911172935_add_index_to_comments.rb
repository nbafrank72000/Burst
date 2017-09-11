class AddIndexToComments < ActiveRecord::Migration[5.1]
  def change
  	add_index :comments, [:article_id, :created_at]
  	add_index :comments, [:user_Id]
  end
end
