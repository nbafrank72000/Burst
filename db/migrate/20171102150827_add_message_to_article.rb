class AddMessageToArticle < ActiveRecord::Migration[5.1]
  def change
  	add_column :articles, :message, :string
  end
end
