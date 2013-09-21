class TodosController < ApplicationController

	def new
		
		@todo = User.find(session[:userid]).todos.build
	end
	def create
	end
	def destroy
	end
	def edit
	end
	def update
	end
	def show
	end
	def showEach
	end

end
