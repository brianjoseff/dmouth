class PagesController < ApplicationController
  skip_before_filter :require_login 
  def index
    @articles = Article.last(5)
    @quotes = Quote.all
  end
  
  def about
  end
  
  def contact
  end
end