class User < ApplicationRecord
	has_many :comments, dependent: :destroy

	attr_accessor :remember_token
	before_save :email_downcase

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length: { maximum: 20 }
	validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }


	class << self
		def new_token
			SecureRandom.urlsafe_base64
		end

		def digest(string)
			cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
			BCrypt::Password.create(string, cost: cost)
		end
	end

	def authenticated?(attribute, token)
			digest = self.send("#{attribute}_digest")
			return false if digest.nil?
			BCrypt::Password.new(digest).is_password?(token)
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

	private

	def email_downcase
		self.email = email.downcase
	end

end
