# frozen_string_literal: false
# Users controller
class UsersController < ApplicationController
  load_and_authorize_resource

  skip_before_filter :require_login, only: [:new, :create, :home]

  def new
    @user.images.build
  end

  def create
    if @user.save
      flash[:success] = 'Signed Up'
      redirect_to log_in_path
    else
      @user.images.build
      render 'new'
    end
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User deleted.'
  end

  def show
  end

  def import
    User.import(params[:file])
    redirect_to users_path, notice: 'Users imported.'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                 :birthday, :active, :password,
                                 :password_confirmation, :images_attributes,
                                 :position, :role,
                                 images_attributes: [:imageable_id,
                                                     :imageable_type,
                                                     :image])
  end
end
