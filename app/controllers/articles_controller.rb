class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show

  end

  def index
  	@articles = Article.paginate(page: params[:page], per_page: 2)
  end

  def new
  	@article = Article.new
  end

  def edit

  end

  def create
    @article = Article.new(whitelist_article)
    @article.user = current_user
    if @article.save
      flash[:notice] = "Post saved succesfully!"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(whitelist_article)
      flash[:notice] = "Post edited succesfully!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Post succesfully deleted!"
    redirect_to articles_path
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end

  def whitelist_article
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can't do that."
      redirect_to @article
    end
  end

end