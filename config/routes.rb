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

  root to: "application#index"
end
