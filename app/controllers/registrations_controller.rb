class RegistrationsController < ApplicationController
  
  def new
    if logged_in?
      redirect_to dashboard_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to new_login_path
    else
      flash[:alert] = "Could not create the user, sorry. (#{@user.errors.full_messages})"
      
      ## Will user redirect_to instead of render :new because render leads to an empty scope for the params email and password ... 
      ## meaning we will get name="email" and name="password" instead name="user[email]" and name="user[password]"
      redirect_to new_registration_path
      #render :new, status: :unprocessable_entity 
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end


end
