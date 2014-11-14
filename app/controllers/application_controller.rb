class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
  	@current_user ||= user_from_session
  end

  def user_from_session
  	User.find_by(id: session[:user_id])
  end

  def require_user
    if !current_user
      redirect_to sign_in_url, alert: "Please sign in first"
    end
  end

  def require_admin
    require_user
    if !current_user.admin?
      redirect_to :back, alert: "ADMINS ONLY!!!"
    end
  end
end
