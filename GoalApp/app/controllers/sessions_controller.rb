class SessionsController < ApplicationController
    before_action :ensure_logged_in, only: [:destroy]

    # login page. heelper for create. Kind of. 
    def new
        @user = User.new
        render :new
    end

    # When you login
    def create
        @user = User.find_by_credential(params[:user[:username]], params[:user[:password]])
        if @user
            login(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = ["invalid login"]
            render :new
        end
    end

    # logout
    def destroy
        logout
        flash[:success] = ["Logged out!!!!!!! THIS IS IN FLASH"]
        redirect_to new_session_url
    end
end
