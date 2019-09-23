class ArticlesController < ApplicationController
  def home

  end
  def about

  end
  def new
    @article=Article.new
  end
  def create
#render plain: params[:article].inspect
    @article=Article.new(article_params)
    respond_to do |f|
      if @article.save
        #flash[:notice]="Article was sucessfully created"
         #redirect_to articles_path/(@article)
         f.html(redirect_to articles_path(@article),notice: 'now it is created ')
      else
        render 'new'
      end
    end
  end
  def show
    @articles=Article.find(params[:id])
  end
  private
    def article_params
        params.require(:article).permit(:title,:description)
    end

end
