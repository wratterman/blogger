class ArticlesController < ApplicationController
  before_action :set_article, only: [:destroy, :edit, :update]
  before_filter :require_login, only: [:index]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    flash.notice = "Article '#{@article.title}' Deleted!"

    redirect_to '/'
  end

  def edit
    flash.notice = "Article '#{@article.title}' Edited!"
  end

  def update
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  private

  def article_params
     params.require(:article).permit(:title, :body, :tag_list, :image)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
