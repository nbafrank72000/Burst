class BlogsController < ApplicationController
	def home
		@articles = Article.all
	end

	def profile
		
	end
end
