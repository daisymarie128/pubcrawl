Rails.application.routes.draw do

  resources :users, :pub_challenges
  root :to => 'pages#index'
  get '/session' => 'session#new'
  post '/session' => 'session#create'
  delete '/session' => 'session#destroy'

end