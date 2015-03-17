class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  before_action :require_login

  private
  	def sign_in(user)
  		session[:user_id] = user.id if user.present?
  	end

  	def sign_out
  		session[:user_id] = nil
  	end

  	def current_user
  		User.find_by id: session[:user_id] if session[:user_id]
  	end

    def require_login
      unless current_user
        flash[:alert] = "No access. Please login first."
        redirect_to login_path
      end
    end
end
