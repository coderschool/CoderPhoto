class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def like
    @photo = Photo.find params[:id]
    @photo.liked_by!(current_user)
  end

  def unlike
    @photo = Photo.find params[:id]
    @photo.unliked_by!(current_user)
  end
end
