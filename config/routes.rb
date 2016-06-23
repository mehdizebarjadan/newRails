Rails.application.routes.draw do

  get 'likes/create'
  get "/users/new" => "users#new"
  post "users" => "users#create"
  patch '/users/:id/edit' => 'users#update'
  get 'sessions/new' => "sessions#new"
  post "sessions" => "sessions#create"
  get "/users/:id" => "users#show"
  get "/users/:id/edit" => "users#edit"
  delete 'sessions' => 'sessions#destroy'
  delete '/users/:id' =>'users#destroy'  
  get '/secrets' => 'secrets#index'
  post '/secrets' => 'secrets#create'
  delete '/secrets/:id' => 'secrets#destroy'
  post '/likes' => 'likes#create'
  delete '/likes/:id' => 'likes#destroy'

  root "sessions#new"
end
