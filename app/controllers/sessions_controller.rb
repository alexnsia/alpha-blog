class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #if params[:Remember_me]
      #cookies.permanent[:auth_token] = user.auth_token
    #else
      #cookies[:auth_token] = user.auth_token
    #end
    flash[:success] = "You have successfully logged in"
    redirect_to user_path(user)
  else
      flash.now[:danger] = "There was somthing wrong with your login information"
      render 'new'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end
