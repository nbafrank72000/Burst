class ModifyCommentContent < ActiveRecord::Migration[5.1]
  def change
  	remove_column :comments, :content, :string
  	add_column :comments, :message, :string
  end
end
