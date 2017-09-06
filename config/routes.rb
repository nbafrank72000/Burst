Rails.application.routes.draw do
  get 'articles/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#home'

  resources :blogs do
  	collection do
  		get :home
  		get :profile
  	end
  end

  resources :articles

end
