Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :articles do
collection {post :import}
end

root 'pages#home'
get 'pages/about', to: 'pages#about'
get 'pages/test', to: 'pages#test'
get 'signup', to: 'users#new'
resources :users, except: [:new]
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'
end