# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  def logged_in_user
    redirect_to root_url unless logged_in?
  end
end
