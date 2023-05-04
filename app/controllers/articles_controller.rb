class ArticlesController < ApplicationController
  before_action :move_to_signed_in, omly: [:index]

  def index
      @articles = Article.all
      @articles = Article.where(user_id: current_user.id).includes(:user)
      #@line_chart = {@articles.start_time => @articles.weight}
      #@article = Article.find(params[:id])
      #@line_chart = []
      #@articles.each do |rec|
        #@line_chart << rec.weight
      #[['2019-06-01', 30 ], ['2019-06-02', 200], ['2019-06-03', 150]]
      #end
      #@result = Article.(:start_time, :weight)
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
    #Article.create(article_params)
    #redirect_to root_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:start_time, :title, :weight, :target_weight, :meal, :exercise, :condition, :disease, :diary).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  '/tops/'
    end
  end
end
