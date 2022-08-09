class LoginsController < ApplicationController
  
  def new
    if logged_in?
      redirect_to dashboard_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.find_by(user_params)
    if @user
      log_in @user
      redirect_to session[:forwarding_url] || dashboard_path 
    else
      flash[:alert] = "Email and/or password is wrong."

      ## Will user redirect_to instead of render :new because render leads to an empty scope for the params email and password ... 
      ## meaning we will get name="email" and name="password" instead name="user[email]" and name="user[password]"
      redirect_to new_login_path
      #render :new, status: :unprocessable_entity
    end
  end

  private 

    def user_params
      params.require(:user).permit(:email, :password)
    end

end
