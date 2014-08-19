Rails.application.routes.draw do

  resources :users, :pub_challenges, :pubs
  root :to => 'pages#index'
  get '/session' => 'session#new'
  post '/session' => 'session#create'
  delete '/session' => 'session#destroy'

end