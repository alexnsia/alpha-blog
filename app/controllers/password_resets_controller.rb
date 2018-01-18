class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_eamil(params[:email])
    user.send_password_reset if user
    flash[:success] = "Email was sent to youe email with Password Reset instructions."
    redirect_to root_path
  end

  def edit
    @user = user.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.find_password_reset_sent_at < 2.hours.ago
      flash[:success] = "Password reset has expired."
      redirect_to new_password_reset_path
    elsif @user.update_attributes(params[:user])
      flash[:success] = "Your password has reset successfully!"
      redirect_to root_path
  else
    render :edit
    end
  end
end
