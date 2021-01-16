Rails.application.routes.draw do
  namespace :admin do
    resources :events
    resources :user_ones
    resources :user_twos

    root to: "events#index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "events#index"
  get '/events/:id', to: 'events#show'
  get '/events/:id/apply', to: 'events#apply'

  post '/users/1/new', to: 'events#create_user_one'
  post '/users/1/verify', to: 'events#verify_user_one'
  post '/users/1/confirm', to: 'events#confirm_user_one'


  get '/finished', to: 'events#finished'
end
