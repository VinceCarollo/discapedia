class LoginController < ApplicationController
  def new
    redirect_back(fallback_location:) if User.exists?(session[:user_id])
    session[:user_id] = nil
  end

  def create
    @user = User.find_by(username: permitted[:username])
    if @user&.authenticate(permitted[:password])
      session[:user_id] = @user.id
      redirect_to admin_discs_path
    else
      render :new
    end
  end

  private

  def permitted
    params.permit(:username, :password)
  end

  def fallback_location
    admin_discs_path
  end
end
