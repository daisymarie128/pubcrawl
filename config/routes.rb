Rails.application.routes.draw do

  resources :users, :pub_challenges, :pubs
  root :to => 'pages#index'
  get '/session' => 'session#new'
  post '/session' => 'session#create'
  delete '/session' => 'session#destroy'
  get '/current_user' => 'users#current_user_check'

end

#             Prefix Verb   URI Pattern                        Controller#Action
#              users GET    /users(.:format)                   users#index
#                    POST   /users(.:format)                   users#create
#           new_user GET    /users/new(.:format)               users#new
#          edit_user GET    /users/:id/edit(.:format)          users#edit
#               user GET    /users/:id(.:format)               users#show
#                    PATCH  /users/:id(.:format)               users#update
#                    PUT    /users/:id(.:format)               users#update
#                    DELETE /users/:id(.:format)               users#destroy
#     pub_challenges GET    /pub_challenges(.:format)          pub_challenges#index
#                    POST   /pub_challenges(.:format)          pub_challenges#create
#  new_pub_challenge GET    /pub_challenges/new(.:format)      pub_challenges#new
# edit_pub_challenge GET    /pub_challenges/:id/edit(.:format) pub_challenges#edit
#      pub_challenge GET    /pub_challenges/:id(.:format)      pub_challenges#show
#                    PATCH  /pub_challenges/:id(.:format)      pub_challenges#update
#                    PUT    /pub_challenges/:id(.:format)      pub_challenges#update
#                    DELETE /pub_challenges/:id(.:format)      pub_challenges#destroy
#               pubs GET    /pubs(.:format)                    pubs#index
#                    POST   /pubs(.:format)                    pubs#create
#            new_pub GET    /pubs/new(.:format)                pubs#new
#           edit_pub GET    /pubs/:id/edit(.:format)           pubs#edit
#                pub GET    /pubs/:id(.:format)                pubs#show
#                    PATCH  /pubs/:id(.:format)                pubs#update
#                    PUT    /pubs/:id(.:format)                pubs#update
#                    DELETE /pubs/:id(.:format)                pubs#destroy
#               root GET    /                                  pages#index
#            session GET    /session(.:format)                 session#new
#                    POST   /session(.:format)                 session#create
#                    DELETE /session(.:format)                 session#destroy