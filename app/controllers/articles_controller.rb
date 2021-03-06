class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # display whats being passed without sending to db
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created"
      # redirect after create
      redirect_to article_path(@article)
    else
      render 'new'
    end

  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end


  # whitelisting the article to database
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
