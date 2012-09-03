class PagesController < ApplicationController
  skip_before_filter :require_login, :except => [:admin]
  def index
    @articles = Article.last(5)
    
    # return 5 most viewed articles
    @favorites = Article.order("counter_cache DESC").first(5)
    
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