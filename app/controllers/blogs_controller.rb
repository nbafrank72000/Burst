#require "application_responder"
class BlogsController < ApplicationController
	#respond_to :js
	def home
		@articles = Article.all
		#respond_with(@articles)
	end

	def profile
		
	end
end
