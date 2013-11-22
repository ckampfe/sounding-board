SoundingBoard::Application.routes.draw do
  resources :users
  resources :posts do
    collection do
      get 'search'
    end

    resources :comments, :only => [:create]
  end

  resources :comments, :except => [:create]

  get '/login'   => 'users#login'
  post '/login'  => 'users#create_login'
  post '/logout' => 'users#logout'

  get '/my_posts' => 'my_posts#index'
  get '/posts/new' => 'posts#create'

  post '/comments/:id/upvote' => "comments#upvote"
  post '/comments/:id/downvote' => "comments#downvote"


  root to: "application#index"
end
