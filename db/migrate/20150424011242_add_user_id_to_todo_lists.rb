class AddUserIdToTodoLists < ActiveRecord::Migration
  def change
    add_column :todo_lists, :user_id, :string
  end
end
