class SessionsController < ApplicationController

	def new
		render layout: "home"
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
		flash[:notice]= "Signed out"
		redirect_to root_url
	end


end
