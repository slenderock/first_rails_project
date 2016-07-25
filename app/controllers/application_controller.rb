class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  helper_method :current_user

  rescue_from CanCan::AccessDenied do ||
    flash[:error] = 'Access denied.'
    redirect_to root_url
  end

  private

  def current_user
    @current_user ||= User.find(current_user_id) if current_user_id
  end

  def current_user_id
    session[:user_id]
  end

  def require_login
    unless current_user
      flash[:error] = 'You must be logged in to access this section'
      redirect_to log_in_path
    end
  end
end
