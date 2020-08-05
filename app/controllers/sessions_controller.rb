class SessionsController < ApplicationController
    def new
    end 
    
    def create
        @user = User.find_by(name: params[:user][:name])
        return redirect_to action: 'new' unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to controller: 'users', action: 'welcome'
    end

    def destroy 
        session.delete :user_id
        redirect_to '/'
    end 
end