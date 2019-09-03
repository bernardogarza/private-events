# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_url
    else
      render 'new'
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in user
      remember user
      flash[:succsess] = 'Welcome'
      redirect_to root_url
    else
      flash[:errors] = ['Invalid e-mail']
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    user = current_user
    sign_out user
    forget user
    redirect_to root_url
  end
end
