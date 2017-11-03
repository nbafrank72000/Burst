class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	accepts_nested_attributes_for :comments
	
	default_scope -> { order(created_at: :desc) }
end
