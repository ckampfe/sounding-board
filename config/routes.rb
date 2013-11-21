SoundingBoard::Application.routes.draw do
  resources :users
  resources :posts

  get '/login' => 'users#login'
  post '/login' => 'users#create_login'

  post '/logout' => 'users#logout'

  get '/my_posts' => 'my_posts#index'

  root to: "application#index"
end
