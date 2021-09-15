class TodoListsController < ApplicationController
	before_action :set_todo_list, only: [:show, :edit, :update]

	def index
		@todo_lists = TodoList.all
		@todo_list = TodoList.new
	end

	def show
	end

	def create
		@todo_list = TodoList.new(todo_list_params)

		if @todo_list.save
			redirect_to todo_lists_url, notice: 'Todo List has been successfully created.'
		else
			# render :new 
		end 
	end

	def edit
	end

	def update
		if @todo_list.update(todo_item_params)
			redirect_to @todo_list, notice: "Todo List has been successfully updated."
		else
			render :edit 
		end
	end

	private
		def todo_list_params
			params.require(:todo_list).permit(:title)
		end

		def set_todo_list
			@todo_list = TodoList.find(params[:id])
		end
end
