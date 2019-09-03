# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    current_user = user
  end

  def current_user
    user = if session[:user_id]
             User.find(sessions[:user_id])
           elsif cookies[:user_id]
             User.find(cookies[:user_id])
           end
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user=(user)
    sessions[:user_id] = user.id
    current_user = current_user
  end

  def sign_out(user)
    session.delete(:user_id) if user == current_user
  end

  def remember(user)
    user.remember
    cookies.permanent[:user_id] = user.id
    cookies.permanent[:remember_digest] = user.remember_digest
  end

  def forget(_user)
    cookies.delete(:user_id)
    cookies.delete(:remember_digest)
  end
end
