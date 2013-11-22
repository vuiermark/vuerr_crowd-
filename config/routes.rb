VuerrCrowd::Application.routes.draw do
  
  devise_for :users
  root "projects#index"
 
  resources :projects do
  	resources :pledges
  end
  
  resources :charges
end
