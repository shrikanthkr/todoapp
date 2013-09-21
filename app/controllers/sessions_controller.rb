class SessionsController < ApplicationController

	def new

	end
	def create
		user = User.authenticate(params[:email],params[:password])
		if user
			session[:userid] = user.id
			redirect_to users_profile_path
		else
			flash.now.alert = "Invalid credentials"
			render "new"
		end

	end
	def destroy
		session[:userid] = nil
		redirect_to root_url
	end


end
