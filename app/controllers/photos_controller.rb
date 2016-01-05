class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def like
    @photo = Photo.find params[:id]
    @photo.liked_by!(current_user)
    PhotoMailer.notify_likes(@photo, current_user).deliver_later
  end

  def unlike
    @photo = Photo.find params[:id]
    @photo.unliked_by!(current_user)
    render 'like'
  end
end
