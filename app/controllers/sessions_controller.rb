class SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:notice] = "Welcome back, #{user.name.capitalize}."
			redirect_to articles_path
		else
			flash.now[:alert] = "Sorry, Incorrect credentials."
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Successfully logged out."
		redirect_to root_path
	end
end