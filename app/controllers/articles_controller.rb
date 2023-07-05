class ArticlesController < ApplicationController

  include Paginable

  def index
    paginated = paginate(Article.recent)
    render_collection(paginated)
  end

  def show
    @article = Article.find(params[:id])
    if @article
      render json: @article, status: :ok
    end
  end

  def serializer
    ArticleSerializer
  end


end
