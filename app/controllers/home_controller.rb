#Author: Blake McGillis
#Date: April 23, 2015

class HomeController < ApplicationController

#Index action. Checks if the user is signed in. If so, they are directed to the
#Todo Lists index.
def index
  if user_signed_in?
      redirect_to :controller => 'todo_lists', :action => 'index'
  end
end
    
end
