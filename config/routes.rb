SoundingBoard::Application.routes.draw do
  resources :users
  resources :posts do
    collection do
      get 'search'
      get 'refresh'
    end

    resources :comments, :only => [:create]
  end


  resources :comments, :except => [:create]

  get '/login'   => 'users#login'
  post '/login'  => 'users#create_login'
  post '/logout' => 'users#logout'

  get '/my_posts' => 'my_posts#index'

  get '/posts/new' => 'posts#create' # HUH? WHAT IS THIS?

  post '/comments/:id/upvote' => "comments#upvote"
  post '/comments/:id/downvote' => "comments#downvote"

  get '/songs/search' => "songs#search"
  get '/songs/search_for_use_by_comment' => "songs#search_for_use_by_comment"
  get '/songs/display_search_results' => "songs#display_search_results"

  root to: "application#index"
end
