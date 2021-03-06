# frozen_string_literal: false
# Session Controller
class SessionsController < ApplicationController
  skip_before_filter :require_login

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to current_user, notice: 'Logged in!'
    else
      @error = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
