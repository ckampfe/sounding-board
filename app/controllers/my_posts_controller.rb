class MyPostsController < ApplicationController

  def index
    current_user = User.find(1)
    my_created_posts = current_user.posts

    my_posts_commented_on = current_user.posts_commented_on

    @my_posts = [my_created_posts, my_posts_commented_on].flatten.uniq!
    render :file => "my_posts"
  end

end
