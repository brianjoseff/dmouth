class DisplayNumbersController < ApplicationController
  def new
    @display_number = DisplayNumber.new
  end
#   def edit
#     @display_number = DisplayNumber.find(1)
#   end
#   def update
#     @display_number = DisplayNumber.find(1)
#   end
  def create
    @display_number = DisplayNumber.new(params[:display_number])

    respond_to do |format|
      if @display_number.save
        format.html { redirect_to root_path, notice: 'Successfully changed number of articles displayed.' }
        format.json { render json: @display_number, status: :created, location: @display_number }
      else
        format.html { redirect_to root_path, notice: 'Messed up' }
        format.json { render json: @display_number.errors, status: :unprocessable_entity }
      end
    end
  end
end