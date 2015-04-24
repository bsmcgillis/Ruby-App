#Author: Blake McGillis
#Date: April 23, 2015

#Setup for todo lists
class TodoList < ActiveRecord::Base
    
    #Sets todo lists to contain multiple todo items
    has_many :todo_items
    
    #Sets up todo lists to be associated with a user
    belongs_to :user
end
