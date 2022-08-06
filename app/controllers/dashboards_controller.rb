class DashboardsController < ApplicationController
    
    def index
        user = User.find_by(id: session[:user_id])
        redirect_to new_logins_path unless user
    end

end
