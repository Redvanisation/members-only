class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password]) 
      log_in user
      remember user
      flash[:success] = "Welcome back you are in!"
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid Username/password combination"
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = "Logged out successfully, come back soon!"
    redirect_to root_url
  end
end
