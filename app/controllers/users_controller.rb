class UsersController < ApplicationController
	include UsersHelper
	before_action :require_session , except: ["index","new","create"]

	def index
		@user = User.new
		render layout: "home"
	end
	def new
		@user = User.new
		render layout: "home"
	end
	def create
		@user = User.new(user_params)
		if(@user.save)
			session[:userid] = @user.id
			redirect_to users_profile_path
		else
			@text=""
			@user.errors.full_messages.each do |msg| 
				@text = @text+msg.to_s
			end
			#render text: @text.to_s
			render "index"
		end

	end
	def profile
		@user = User.find(session[:userid])
	end

	private
	def user_params
		params.require(:user).permit(:name,:email,:password,:password_confirmation)
	end

end
