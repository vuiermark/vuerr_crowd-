VuerrCrowd::Application.routes.draw do
  
  devise_for :users
  root "projects#index"
 
  resources :projects do
  	resources :pledges do
  		collection do
  		 post 'contribute'
  		end
  	end
  end
  
  resources :charges 
  	

end
