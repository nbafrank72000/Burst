Rails.application.routes.draw do
  get 'articles/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#home'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  get '/signup', to: 'users#new'

  resources :blogs do
  	collection do
  		get :home
  		get :profile
  	end
  end

  resources :articles
  resources :users
  resources :comments

end
