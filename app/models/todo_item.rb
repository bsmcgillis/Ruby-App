#Author: Blake McGillis
#Date: April 23, 2015

#Setup for todo list items
class TodoItem < ActiveRecord::Base
  
  #Marks all todo list items as part of a todo list    
  belongs_to :todo_list
    
  #A method to check if the item has been marked completed    
  def completed?
    !completed_at.blank?      
  end
end
