class SessionsController < ApplicationController
	def new
		render
	end

	def create
		user = User.find_by(email: params[:email])

		if user && user.authentic?(params[:password])
			session[:user_id] = user.id 
			redirect_to root_url, notice: "Welcome back!"
		else
			redirect_to sign_in_url, alert: "WRONG PASSWORD, SUCKER"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "Y'all come back, now. Y'hear?"
	end
end