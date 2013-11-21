class PostsController < ApplicationController

  def new

  end

  def create
    # FAKING SONG CREATION FOR NOW, WILL DO REAL STUFF WHEN WE USE RDIO
    # SEE BELOW FOR POSSIBLE TEMPLATE OF REAL SONG CREATION

    # rdio_song = nil # Will be the song object from Rdio

    # song_params = {
    #   :short_url => rdio_song.short_url,
    #   :title => rdio_song.title,
    #   :artist => rdio_song.artist,
    #   :album => rdio_song.album,
    #   :year => rdio_song.year
    # }

    # @song = Song.new(song_params)

    @song = Song.create(
      :short_url => "http://www.google.com",
      :title => "Fake Song Title",
      )



    post_params = {
      :title => params[:post][:title],
      :motivation => params[:post][:motivation],
      :user_id => params[:post][:user_id],
      :song_id => @song.id
    }

    @post = Post.new(post_params)

    # self.current_user.posts << @post #UNCOMMENT THIS WHEN DOING REAL THING

    ## Handle creation of Song object, grabbing song data from search results
    ## from Rdio here. Then associate song with this post and save song.
    # @song = Song.new(params[:song]) # Example code, not necessarily correct

    # @post.song_id = 1 # Fake a song ID for now, EDIT THIS LATER!!!

    if @post.save
      # May need to save user and song here
      redirect_to "/"
    else
      puts "FAILED TO SAVE!!!" #Replace this and handle failed save here.
    end
  end

  def index

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

end