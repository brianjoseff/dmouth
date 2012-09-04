class ArticlesController < ApplicationController
  before_filter :require_login, :except => [:index, :show]
  
  
  #impressionist gem logs page views
  impressionist :actions => [:show]
  
  
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all(:order=> "created_at DESC")
    @archive_items = Article.all(:order=> "created_at DESC")
    @title = "Archive"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @rating = Rating.new
    
    #limited to first 5
    @related_articles = @article.find_related_tags.limit(5)
    
    @ratings = @article.ratings
    @quality = quality_avg(@ratings)
    @interest = interest_avg(@ratings)
    @readagain = readagain_avg(@ratings)
    @words = get_words(@ratings)
    
    
    
    @title = "Specialties of the Day"
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
    @article.assets.build
    @assets = @article.assets
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    @assets = @article.assets
    @article.assets.build
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])
    tags_str = params[:article].delete(:tag_list)
    @article.tag_list = tags_str
    
    
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])
    #check_for_destroys
    
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
  private
  def quality_avg(ratings)
    q_total=0
    if ratings.count == 0
      return "no rating yet"
    else
      ratings.each do |rating|
        unless rating.quality.nil?
          q_total += rating.quality
        end
      end
      return q_total/ratings.count  
    end  
    
  end
  
  def readagain_avg(ratings)
    ra_total=0
    if ratings.count == 0
      return "no rating yet"
    else
      ratings.each do |rating|
        unless rating.readagain.nil?
          ra_total += rating.readagain
        end
      end
      return ra_total/ratings.count  
    end  

  end
 
  def interest_avg(ratings)
    i_total=0
    if ratings.count == 0
      return "no rating yet"
    else
      ratings.each do |rating|
        unless rating.interest.nil?
          i_total += rating.interest
        end
      end
      return i_total/ratings.count  
    end
  end
  
  def get_words(ratings)
    if ratings.count == 0
      return nil
    else
      words = []
      ratings.each do |rating|
        unless rating.qualitative.empty?
          words << rating.qualitative
        end
      end
      return words 
    end
  end
end
