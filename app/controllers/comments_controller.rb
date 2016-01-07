class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = @photo.comments.build(comment_params)
    @comment.user = current_user
    @comment.save

    respond_to do |format|
      format.html do
        if @comment.persisted?
          redirect_to photos_path, flash: {success: "Comment added"}
        else
          redirect_to photos_path, flash: {alert: "Failed to add comments"}
        end
      end

      format.js
    end
  end

  def like
    @comment = Comment.find params[:id]
    @vote = @comment.liked_by! current_user
  end

  def unlike
    @comment = Comment.find params[:id]
    @comment.unliked_by! current_user
    render 'like'
  end

  private

  def load_photo
    @photo = Photo.find params[:photo_id]
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
