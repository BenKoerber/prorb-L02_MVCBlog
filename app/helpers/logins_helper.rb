module LoginsHelper

  def log_in(user)
    reset_session
    session[:user_id] = user.id
  end

  def log_out
    reset_session
    @current_user = nil
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to new_login_path
    end
  end  

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

end
