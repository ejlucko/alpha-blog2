class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    #render plain: params[:article] will output the title and description as a hash on a plain white page.  Use for debugging or curiosity
    #to create a new article we need title and description, these are provided by the params hash 
    #article is the key and a hash containing title and description is the value. We can reference the article key as a symbol
    #@article = Article.new(params[:article]). You'd think this would be enough to save the article
    #it isn't because you need to whitelist the parameters to save to the database.
    @article = Article.new(params.require(:article).permit(:title, :description)) #whitelisting strong parameters
    #create a new article and require that article, (key from the params hash), to only allow a title and descripion to be saved
    #render plain @article.inspect will show our article table entry on a blank page but since it hasn't been saved yet, everything will be nil except title and description
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article #shorthand for`redirect_to article_path(@article) which will grab the article id and match the routes show path for articles
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

end