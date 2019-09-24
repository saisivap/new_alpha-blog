class ArticlesController < ApplicationController
  logger = Logger.new STDOUT
  def home

  end
  def index
    @my_articles=Article.all
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

    @article=Article.find(params[:id])
    # logger = Logger.new STDOUT
    logger.info"show articleinfo"
    logger.info @article
  end

  def edit
     @article=Article.find(params[:id])
  end
  def update
    @article=Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice]="Article was sucessfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  private
    def article_params
        params.require(:article).permit(:title,:description)
    end

end
