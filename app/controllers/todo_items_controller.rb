#Author: Blake McGillis
#Date: April 23, 2015

class TodoItemsController < ApplicationController
    
    #Set up variables to be used by public methods
    before_action :set_todo_list
    before_action :set_todo_item, except: [:create]
    
    #Creates a new Todo List Item
    def create
        @todo_item = @todo_list.todo_items.create(todo_item_params)  
        redirect_to @todo_list, notice: "Todo item added"
    end
    
    #Destroys a Todo List Item
    def destroy
        message = nil
        if @todo_item.destroy
            message = "Todo List item was deleted."
        else          
            message = "Todo List item could not be deleted." 
        end
        redirect_to @todo_list, notice: message
    end
    
    #Marks a Todo List Item complete
    def complete
        @todo_item.update_attribute(:completed_at, Time.now)
        redirect_to @todo_list, notice: "Todo item completed"
    end
    
    private
    
    #Set up the todo_list variable
    def set_todo_list
        @todo_list = TodoList.find(params[:todo_list_id])
    end
    
    #Set up the todo_item variable
    def set_todo_item
        @todo_item = @todo_list.todo_items.find(params[:id])
    end
    
    #Set up the todo_item parameters
    def todo_item_params
        params[:todo_item].permit(:content)
    end
    
end
