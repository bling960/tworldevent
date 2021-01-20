Rails.application.routes.draw do
  namespace :admin do
    resources :events
    resources :user_ones
    resources :user_twos
    resources :event_ones
    resources :settings

    root to: "events#index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "events#index"
  get '/events/1', to: 'events#show_one'
  get '/events/2', to: 'events#show_two'

  get '/events/1/apply', to: 'events#apply_one'
  get '/events/2/apply', to: 'events#apply_two'

  post '/users/1/submit', to: 'user_ones#submit_user_one'

  post '/users/2/new', to: 'user_twos#create_user_two'
  post '/users/2/submit', to: 'user_twos#submit_user_two'

  get '/user_one/export', to: 'user_ones#export_csv'
  get '/user_two/export', to: 'user_twos#export_csv'

  get '/user_one/destroy_all', to: 'user_ones#destroy_all'
  get '/user_two/destroy_all', to: 'user_two#destroy_all'

  get '/finished', to: 'events#finished'
end
