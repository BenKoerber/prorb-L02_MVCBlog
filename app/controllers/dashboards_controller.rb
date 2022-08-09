class DashboardsController < ApplicationController
    
  def index
    #redirect_to new_login_path unless logged_in?
    if logged_in?
      @post = current_user.posts.build
    end
    @postfeed_items = Post.postfeed_items
  end

end
