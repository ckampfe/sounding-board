class CommentsController < ApplicationController

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
