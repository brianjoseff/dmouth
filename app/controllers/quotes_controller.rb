class QuotesController < ApplicationController
  before_filter :require_login
 
  def index
    @quotes = Quote.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quotess }
    end
  end
  
  def new
    @quote = Quote.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quote }
    end
  end
  
  def create
    @quote = Quote.new(params[:quote])
    respond_to do |format|
      if @quote.save
        format.html { redirect_to quotes_path, notice: 'quote was successfully created.' }
        format.json { render json: @quote, status: :created, location: @quote }
      else
        format.html { render action: "new" }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @quote = Quote.find(params[:id])
  end
  
  def update
    @quote = Quote.find(params[:id])
    
    respond_to do |format|
      if @quote.update_attributes(params[:article])
        format.html { redirect_to quotes_path, notice: 'quote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url }
      format.json { head :no_content }
    end
  end 
end
