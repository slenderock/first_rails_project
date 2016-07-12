# frozen_string_literal: false
# Users controller
class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create, :home]

  def show
  end

  def new
    @user = User.new
    @user.images.build
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = 'Signed Up'
      redirect_to log_in_path
    else
      @user.images.build
      render 'new'
    end
  end

  def edit
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def update
    if current_user.update_attributes(params[:user])
      flash[:success] = 'Profile updated'
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def home
  end
end
