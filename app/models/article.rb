class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	default_scope -> { order(created_at: :desc) }
end
