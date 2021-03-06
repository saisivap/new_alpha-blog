class ArticlesController < ApplicationController
  before_action :set_id, only: [ :edit, :show, :update, :destroy]
  before_action :require_user, except: [ :index, :show,:home ]
  before_action :require_same_user,only: [:edit,:update,:destroy]
  logger = Logger.new STDOUT
  def home
    redirect_to articles_path if logged_in?
  end
  def index
    @articles=Article.all
    end
  def about

  end
  def new
    @article=Article.new

    # logger.info" article"
    # logger.info @article
  end
  def create
#render plain: params[:article].inspect
    # logger.info article_params
    @article=Article.new(article_params)
    @article.user=current_user
    # respond_to do |f|
      if @article.save
        flash[:notice]="Article was sucessfully created"
         redirect_to article_path(@article)
         # f.html(redirect_to articles_path(@article),notice: 'now it is created ')
      else
        render 'new'
      end
    # end
  end
  def show

    # @article=Article.find(params[:id])
    # logger = Logger.new STDOUT
    logger.info"show articleinfo"
    logger.info @article
  end

  def edit
     # @article=Article.find(params[:id])
  end
  def update
    # @article=Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice]="Article was sucessfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    # @article=Article.find(params[:id])
    @article.destroy
    flash[:notice]="Article was succesfully deleted "
    redirect_to articles_path
  end

  private
    def set_id
      @article=Article.find(params[:id])
    end
    def article_params
        params.require(:article).permit(:title,:description)
    end
  def require_same_user
    if current_user != @article.user && !current_user.admin
      flash[:danger]="you can only edit and delete your articles"
      redirect_to root_path
    end
  end
end

