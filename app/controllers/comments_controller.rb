class CommentsController < ApplicationController

  def create
    @song = get_song_from_rdio(params[:comment][:song])
    @song.save
    @post = Post.find(params[:post_id])

    comment_params = {
      :body => params[:comment][:body],
      :song_id => @song.id,
      :user_id => current_user.id
    }

    @comment = @post.comments.create!(comment_params)

    redirect_to post_path(@post)
  end

  def upvote
    @comment = Comment.find(params[:id])
    @post = @comment.post

    if current_user.comment_votes.where("comment_id = ?", @comment.id).length == 0
      @comment.comment_votes.create(:is_up_vote => true, :user_id => current_user.id)
      redirect_to "/posts/#{@post.id}"
    else
      redirect_to "/posts/#{@post.id}"
    end
  end

  def downvote
    @comment = Comment.find(params[:id])
    @post = @comment.post

    if current_user.comment_votes.where("comment_id = ?", @comment.id).length == 0
      @comment.comment_votes.create(:is_up_vote => false, :user_id => current_user.id)
      redirect_to "/posts/#{@post.id}"
    else
      redirect_to "/posts/#{@post.id}"
    end
  end

end
