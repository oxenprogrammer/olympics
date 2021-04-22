Rails.application.routes.draw do
  root 'articles#index'
  get '/' => 'articles#index' 
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :categories, only: %i[index new create show]
  resources :articles, only: %i[index new create show] do
    resources :votes, only: %i[new create destroy]
  end
end
