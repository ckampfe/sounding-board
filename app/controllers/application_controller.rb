class ApplicationController < ActionController::Base
  protect_from_forgery

  include ControllerHelper

  def index
  end

  #FAKE FOR NOW
  def get_song_from_rdio(search_term)
    @song = Song.new(
        :title => "This is a faked song",
        :short_url => "http://www.google.com",
        :artist => "Faked artist",
        :album => "Faked Album",
        :year => 1000
      )
  end

  def rdio_client
    client ||= OAuth::Consumer.new(
        ENV["RDIO_CONSUMER_KEY"],
        ENV["RDIO_CONSUMER_SECRET"],
        :site => "http://api.rdio.com",
        :scheme => :header
      )
  end

  def rdio_search(search_term)
    rdio_client.
  end
end
