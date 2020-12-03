class ApplicationController < ActionController::Base

helper_method :current_user, :user_signed_in?

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def user_signed_in?
		!!current_user
	end

	def require_user
		if !user_signed_in?
			flash[:alert] = "Please log in."
			redirect_to login_path
		end
		
	end


end
