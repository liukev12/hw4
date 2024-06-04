class SessionsController < ApplicationController
  def new
  end

  def create

    @user = User.find_by({"email" => params["email"]})
    if @user != nil
      if @user && @user.authenticate(params[:password])
      session["user_id"] = @user["id"]
      flash["notice"] = "Hello!"
      redirect_to "/places"    
      else
      flash["notice"] = "Nope. Forget your Email or password?"
      redirect_to "/login"
      end
    else
      flash["notice"] = "Nope. Forget your Email or password?"
      redirect_to "/login"
    end

  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye"
    redirect_to "/login"
  end
end
  
  