class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
      flash[:success] = 'Account created'
    else
      render 'new'
    end
  end

  def show
  end

  private

    def user_params
      params.require(:user).permit(:user_name, :email)
    end
end
