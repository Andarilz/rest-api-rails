class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    render json: @articles, status: :ok
  end

  def show
    @article = Article.find(params[:id])
    if @article
      render json: @article, status: :ok
    end
  end

end
