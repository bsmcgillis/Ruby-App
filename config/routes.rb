#Author: Blake McGillis
#Date: April 23, 2015

Rails.application.routes.draw do

      
  get 'home/index'

  #Initialize authentication     
  devise_for :users
    
  #Add todo_lists as resources    
  resources :todo_lists do
      resources :todo_items do
          member do
              patch :complete
          end
      end
  end
    
  #Set the application root as the index action of the home page    
  root "home#index"
    
end
