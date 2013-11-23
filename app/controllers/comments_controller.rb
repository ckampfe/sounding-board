class CommentsController < ApplicationController

  def create
   song_params = {
      :short_url => params[:song_embed_url],
      :title => params[:song_title],
      :artist => params[:song_artist],
      :album => params[:song_album]
    }
    @song = Song.create!(song_params) if params[:song_embed_url]
    @post = Post.find(params[:post_id])

    comment_params = {
      :body => params[:comment_body],
      :song_id => @song.id if @song,
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
