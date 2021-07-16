class ApplicationController < ActionController::Base
    helper_method :current_user, :loged_in?
    
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def loged_in?
        !!current_user
    end

    def require_user
        if !loged_in?
            flash[:error] = "You must be logged in to perform that action"
            redirect_to login_path
        end
    end
end
