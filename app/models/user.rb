#Author: Blake McGillis
#Date: April 23, 2015

#Setup for todo lists
class User < ActiveRecord::Base
    
  #Authentication setup
  #    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   
  #Sets users up to contain multiple todo lists    
  has_many :todo_lists
end
