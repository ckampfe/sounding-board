require 'spec_helper'

describe PostsController do
  render_views

  let(:song_params) { { :title => "White Christmas", :artist => "Bing Crosby", :album => "Holiday Inn", :year => 1941, :short_url => "http://www.placeholder.com"  } }
  let(:song) { Song.new(song_params) }

  let(:post_params) { { :title => "New Post", :motivation => "Want to share", :user_id => 1, :song_id => song.id } }
  let(:valid_post) { Post.new(post_params) }

  describe "GET new" do
    it "should render the new post form" do
      get :new
      expect(response.body).to include("Share a song")
    end
  end

  describe "POST create" do
    let(:user) { User.create!(:name => "Me", :email => "me123@youabc.com", :password => "123") }

    it "should add a new post to the database" do
      session[:current_user_id] = user.id

      expect{
        post :create, :post => post_params
      }.to change(Post, :count).by(1)
    end
  end
end
