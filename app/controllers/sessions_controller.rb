class SessionsController < ApplicationController
  def new

  end

  def create
    #render'new'
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have succssfuly logged in:"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was somethign wrong with your information"
      render'new'
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out successfully"
    redirect_to root_path

  end
end