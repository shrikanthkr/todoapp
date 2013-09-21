class UsersController < ApplicationController

	def index
	end
	def new
		@user = User.new
	end
	def create
		@user = User.create(user_params)
		if(@user.save)
			
			session[:userid] = @user.id
			redirect_to users_profile_path


		else
			redirect_to new_user_path, alert: "Not valid credentils"
		end

	end
	def profile
			@user = User.find(session[:userid])
		puts "FROM PROFILE"+@user.name
	end

	private
	def user_params
		params.require(:user).permit(:username,:email,:password,:password_confirmation,:name)
	end

end
