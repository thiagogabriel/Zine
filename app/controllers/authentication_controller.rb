class AuthenticationController < ApplicationController
  def new
  end
  
  def create
    user = User.login(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to articles_path, notice: "Logged in!"
    else
      flash[:error] = "Wrong username or password."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to read_path
  end
end
