class UsersController < ApplicationController
    before_action :user_logged_out, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            flash[:success] = "You have signed up successfully!"
            log_in @user
            redirect_to root_url
        else
            flash.now[:danger] = "There has been an error"
            render 'new'
        end
    end


    private

     def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
     end

     def user_logged_out
        return if !logged_in?

        flash[:danger] = "You have to logout first"
        redirect_to root_url
     end
end
