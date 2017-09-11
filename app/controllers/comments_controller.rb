class CommentsController < ApplicationController
	
	def create
		#@article = Article.find(params[:article_id])
		#@comment = @article.comments.build(comment_params)
		#if @comment.save
      flash[:warning] = "Still not open post comment yet! Comming soon~"
      #redirect_to article_path(@comment.article.id)
    #else
     redirect_to root_url
    #end
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end
end
