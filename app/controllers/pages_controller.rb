class PagesController < ApplicationController
  skip_before_filter :require_login, :except => [:admin]
  def index
    @display_number = DisplayNumber.new
    @new_display_number = DisplayNumber.find(:last)
    if @new_display_number.nil?
      flash[:error]= "FUUUUUUUUCK"
      @articles = Article.order("created_at ASC").last(5)
      @favorites = Article.order("counter_cache DESC").first(5)
    else
      @favorites = Article.order("counter_cache DESC").first(@new_display_number.number_of_articles)
      @articles = Article.order("created_at ASC").last(@new_display_number.number_of_articles)
    end
    # return 5 most viewed articles
    
    
    @quotes = Quote.all
  end
  
  def admin
    @articles = Article.all
    @quotes = Quote.all
    @chefs = Chef.all
  end
  
  def about
  end
  
  def contact
  end
end