class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    if User.find_by({"email" => params["email"]})
      flash["notice"] = "you are already a user"
      redirect_to "/users/new"
    else  
      @user["username"] = params["username"]
      @user["email"] = params["email"]
      @user["password"] = BCrypt::Password.create(params["password"])
      if @user.save
        session[:user_id] = @user.id  # Log in the user after sign up
        redirect_to "/"
      else
        render "new"  # Render the form again if save fails
      end
    end
  end
end
private

def user_params
  params.require(:user).permit(:username, :email, :password, :password_confirmation)
end
end