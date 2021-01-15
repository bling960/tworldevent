Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "events#index"
  get '/events/:id', to: 'events#show'
  get '/events/:id/apply', to: 'events#apply'

  post '/users/:id/new', to: 'events#create_user_one'
  post '/users/:id/verify', to: 'events#verify_user_one'


  get '/finished', to: 'events#finished'
end
