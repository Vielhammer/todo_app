class TodoListsController < ApplicationController
	def index
		@todo_lists = TodoList.all
		@todo_list = TodoList.new
	end

	def show
		@todo_list = TodoList.find(params[:id])
	end

	def create
		@todo_list = TodoList.new(todo_list_params)

		if @todo_list.save
			redirect_to todo_lists_url, notice: 'Todo List has been successfully created.'
		else
			# render :new 
		end 
	end

	private
		def todo_list_params
			params.require(:todo_list).permit(:title)
		end
end
