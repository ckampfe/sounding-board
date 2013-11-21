SoundingBoard::Application.routes.draw do
  resources :users

  get '/login' => 'users#login'
  post '/login' => 'users#create_login'

  post '/logout' => 'users#logout'

  root to: "users#index"
end
