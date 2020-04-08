class SessionsController < ApplicationController

    def new
    end

    def create
        # if a user logged in with omniauth (how can we tell?) 
        if request.env["omniauth.auth"]
            #then find or create them in the db by uid
            @user = User.find_by(github_uid: request.env["omniauth.auth"]["uid"])
            if @user.nil?
                @user = User.create(username: request.env["omniauth.auth"]["info"]["nickname"], github_uid: request.env["omniauth.auth"]["uid"], password: "github")
            end
            log_in(@user)
            redirect_to sequences_path
        else
            # locally authenticate the user - verify they exist in the db by username
            # and that their password matches what is in the db
            @user = User.find_by(username: params[:username])
            if !@user
                @error = "Account not found. Please try again."
                render :new
            elsif !@user.authenticate(params[:password])
                @error = "Password incorrect. Please try again."
                render :new
            else
                # if it does, "log them in" with the session hash
                # and redirect them to a meaningful place
                log_in(@user)
                redirect_to sequences_path
            # otherwise, re render the login form, displaying a meaningful error
            end
        end
    end

    def destroy
        session.clear
        redirect_to asanas_path
    end

end