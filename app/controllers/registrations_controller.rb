class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        # render plain: "thanks" - to print in window
        #User.new(params[:user]) is the same to do "User.new({email: "blabla@bla", password: "psw"})
        
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully created account"
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end