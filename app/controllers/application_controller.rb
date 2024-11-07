class ApplicationController < ActionController::Base
  include Pagy::Backend

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user
  helper_method :user_signed_in?

  def current_user
    Current.user ||= User.find_by id: session[:user_id]
  end

  def user_signed_in?
    !!current_user
  end

  def authenticate_user!
    redirect_to new_session_path unless user_signed_in?
  end

  def login(user)
    session[:user_id] = user.id if !!user
  end

  def logout
    reset_session
  end
end
