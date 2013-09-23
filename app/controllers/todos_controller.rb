class TodosController < ApplicationController
	include UsersHelper
	
	before_action :require_session

	def new
		@user = User.find(session[:userid])
		@todo = @user.todos.build

	end
	def create
		@todo = User.find(session[:userid]).todos.build(todo_params)
		if @todo.save
			flash[:notice] = "saved"
			redirect_to users_profile_path
		else
			flash.now.alert = "not saved"
			redirect_to users_profile_path
		end

	end
	def destroy
		if User.find(session[:userid]).todos.destroy(params[:id])
			flash[:notice] =  "Deleted"
			redirect_to todos_path
		else
			flash[:notice]= "Not deleted"
		end
	end
	def edit
	end
	def update

	end

	def index
		@todos = User.find(session[:userid]).todos
		

	end
	def showEach
	end

	private
	def todo_params
		params.require(:todo).permit(:title,:description,:to_date,:to_time)
	end
	


end
