Rails.application.routes.draw do
  namespace :admin do
    resources :events
    resources :user_ones
    resources :user_twos
    resources :settings

    root to: "events#index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "events#index"
  get '/events/:id', to: 'events#show'

  get '/events/1/apply', to: 'events#apply_one'
  get '/events/2/apply', to: 'events#apply_two'

  post '/users/1/submit', to: 'user_ones#submit_user_one'

  post '/users/2/new', to: 'user_twos#create_user_two'
  post '/users/2/submit', to: 'user_twos#submit_user_two'


  get '/finished', to: 'events#finished'
end
