SoundingBoard::Application.routes.draw do
  resources :users

  get '/login' => 'users#login'
  post '/login' => 'users#create_login'

  root to: "users#index"
end
