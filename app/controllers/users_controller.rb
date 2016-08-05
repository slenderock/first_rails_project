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
      render :new
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
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'User deleted.'
    redirect_to users_path
  end

  def show
  end

  def import
    if params[:file]
      UserUploaderWorker.perform_async(params[:file].path)
      flash[:success] = 'Users should be uploaded in few minutes'
    else
      flash[:error] = 'No File Chosen'
    end

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                 :birthday, :active, :password,
                                 :password_confirmation, :images_attributes,
                                 :position, :role,
                                 images_attributes: [:id,
                                                     :imageable_id,
                                                     :imageable_type,
                                                     :image])
  end
end
