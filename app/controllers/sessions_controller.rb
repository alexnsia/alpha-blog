class SessionsController < ApplicationController

  def new

  end

  def create
    #if params[:Remember_me]
    #cookies.permanent[:auth_token] = user.auth_token

    else
      #cookies[:auth_token] = user.auth_token
    end
     #redirect_to


  def destroy
    #cookies.delete(auth_token)
  end

end
