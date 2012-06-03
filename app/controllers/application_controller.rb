class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def require_login
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    unless @user
      flash[:error] = "Login required"
      redirect_to login_path
    end
  end
end
