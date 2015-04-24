#Author: Blake McGillis
#Date: April 23, 2015

class TodoListsController < ApplicationController

    #Set up variables to be used by public functions    
    before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

    #Make sure the user is signed in. If not, send them to the home page with
    #an error message
    def index
      if user_signed_in?
          @todo_lists = TodoList.where(user_id: current_user.id)
      else
          flash[:alert] = "Must be Signed In"
            redirect_to :controller => 'home', :action => 'index'
      end    
    end

  #Declare show method to enable use of the Show action
  def show
  end

  #Create a new todo list to enable use of the New action
  def new
    @todo_list = TodoList.new
  end

  #Declare edit method to enable use of the Edit action
  def edit
  end

  #Creates a new todo list and stores it in the database. 
  def create
    @todo_list = TodoList.new(todo_list_params)
    @todo_list.user = current_user

    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to @todo_list, notice: 'Todo list was successfully created.' }
        format.json { render :show, status: :created, location: @todo_list }
      else
        format.html { render :new }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  #Updates a todo list
  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to @todo_list, notice: 'Todo list was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_list }
      else
        format.html { render :edit }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  #Deletes a todo list
  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #Private methods to set up variables
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end
end
