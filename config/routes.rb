SoundingBoard::Application.routes.draw do
  resources :users
  resources :posts do
    collection do
      get 'search'
    end
  end

  get '/login'   => 'users#login'
  post '/login'  => 'users#create_login'
  post '/logout' => 'users#logout'

  get '/my_posts' => 'my_posts#index'
  get '/posts/new' => 'posts#create'
  

  root to: "application#index"
end
