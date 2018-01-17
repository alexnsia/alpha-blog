class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_eamil(params[:email])
    user.send_password_reset if user
    flash[:success] = "Email sent with password reset instructions"
    redirect_to root_url
  end
end
