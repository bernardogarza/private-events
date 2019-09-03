# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in user
      remember user
      redirect_to root_url
      flash[:success] = 'Account created'
    else
      flash[:errors] = user.errors.full_messages
      render 'new'
    end
  end

  def show
    @myevents = set_user.events
    @user = set_user
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email)
  end

  def set_user
    User.find(params[:id])
  end
end
