class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by( email: params[:session][:email].downcase )
        if User.logged_in
            flash[:succsess] = 'Welcome'
        else
            flash[:error] = @session.errors.full_messages
    end

    def destroy
    
    end
end
