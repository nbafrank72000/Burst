class ArticlesController < ApplicationController
  def index
  	@articles = Article.all
  end

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_params)
  	if @article.save
  		@article.update_attributes(article_params)
  		flash[:success] = "Post new article successfully."
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def edit
  	@article = Article.find(params[:id])
  end

  def update
  	@article = Article.find(params[:id])
    if @article.update(article_params)
      if !params[:comments].nil?
        @comment = @article.comments.create!(:message => params[:comments]['content'], :article_id => @article.id, :user_id => current_user.id)
        flash[:success] = "Article updated"
        redirect_to article_path(@article.id)
      else

      end
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
  end

  def destroy
  	Article.find(params[:id]).destroy
		flash[:success] = "Album deleted"
		redirect_to articles_path
  end

  private

  def article_params
  	params.permit(:title, :content, :picture, :message)
  end
end	