class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    if User.find_by({"email" => params["email"]})
      flash["notice"] = "you have already be a user"
      redirect_to "/users/new"
    else  
      @user["username"] = params["username"]
      @user["email"] = params["email"]
      @user["password"] = BCrypt::Password.create(params["password"])
      @user.save
      redirect_to "/"
    end
  end
end
