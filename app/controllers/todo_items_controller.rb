class TodoItemsController < ApplicationController
	def create
		@todo_list = TodoList.find(params[:todo_list_id])
		@todo_item = @todo_list.todo_items.create(todo_item_params)
		redirect_to @todo_list, notice: "Todo Item has been successfully created."
  end

	private
		def todo_item_params
			params.require(:todo_item).permit(:description)
		end
end
