class CommentsController < ApplicationController
  before_action :load_photo
  
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

  def load_photo
    @photo = Photo.find params[:photo_id]
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
