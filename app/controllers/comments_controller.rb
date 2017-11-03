class CommentsController < ApplicationController
	
	def create
		
	end

	def destroy
		@article = Comment.find(params[:id]).article
		Comment.find(params[:id]).destroy
		flash[:success] = "Comment deleted"
		redirect_to article_path(@article)
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end
end
