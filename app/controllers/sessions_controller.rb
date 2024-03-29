class SessionsController < ApplicationController
  skip_before_filter :require_login 
  
  def new
  end
  
  def create
    @user = User.authenticate(params[:session][:username],
                             params[:session][:password])
    if @user.nil?
      #create an error message and rerender signin form
      flash.now[:error] = "Invalid username/password"
      @title = "Sign in"
      render 'new'
    else
      #sign the user in and redirect to the user's show page.
      sign_in @user
      redirect_back_or root_path
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end
