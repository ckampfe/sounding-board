require 'spec_helper'

describe Post do
  let(:user) { User.create(:name => "John Doe", :email => "john@doe.com", :password => "12345") }

  let(:params) { { :title => "New Post", :motivation => "Want to share", :user_id => user.id, :song_id => 1 } }
  let(:post) { Post.new(params)}

  context "#initialize" do
    it "instantiates a post" do
      post.should be_an_instance_of(Post)
    end
  end

  context "#save" do

  end


end
