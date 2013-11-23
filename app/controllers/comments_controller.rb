class CommentsController < ApplicationController

  def create
  if params[:song_embed_url]
     song_params = {
        :short_url => params[:song_embed_url],
        :title => params[:song_title],
        :artist => params[:song_artist],
        :album => params[:song_album]
      }

      @song = Song.create!(song_params)
    end

    song_id_or_nil = @song.id if @song

    @post = Post.find(params[:post_id])

    comment_params = {
      :body => params[:comment_body],
      :song_id => song_id_or_nil,
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
