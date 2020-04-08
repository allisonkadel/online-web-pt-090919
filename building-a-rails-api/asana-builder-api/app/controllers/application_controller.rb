class ApplicationController < ActionController::Base
    skip_forgery_protection # This allows us to use JS fetch to make a post request to the api without sending an authenticity token in the header (remember, by default Rails protects against this to prevent CSRF attacks)

    def current_user
        User.find_by(id: session[:user_id])
    end

    def require_login
        redirect_to asanas_path unless logged_in?
    end

    def logged_in?
        !!current_user
    end

    def log_in(user)
        session[:user_id] = user.id
    end

end
