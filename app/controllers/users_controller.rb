class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if User.find_by(email: params[:user][:email])
      flash["notice"] = "You are already a user"
      redirect_to "/users/new"
    else  
      if @user.save
        session[:user_id] = @user.id
        redirect_to "/"
      else
        render :new
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end