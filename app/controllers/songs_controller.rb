class SongsController < ApplicationController

  def search
    # puts "HELLO"
    # p params[:post]
    @post_data = params[:post]
    @songs = []
    @res = rdio_search(params[:post][:song])[0..29]
    # puts res
    @res.each do |track|
      @song = Song.new(
        :short_url => track["embedUrl"],
        :title => track["name"],
        :artist => track["artist"],
        :album => track["album"],
        :year => 0
        )
      @songs << @song
    end

    render "rdio_search_results", :locals => { :post_data => params[:post] }
  end

end