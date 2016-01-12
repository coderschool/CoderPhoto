class PhotosController < ApplicationController
  def index
  	@photos = Photo.all
  end

  def edit
    @photo = Photo.find params[:id]
  end

  def update
    @photo = Photo.find params[:id]
    photo_params = params.require(:photo).permit(:caption).merge(locale: I18n.locale)
    if @photo.update_attributes photo_params
      redirect_to root_path, flash: {success: "Updated"}
    else
      redirect_to root_path, flash: {error: "Error: #{@photo.errors.full_messages.to_sentence}"}
    end
  end

  def like
    @photo = Photo.find params[:id]
    @vote = @photo.liked_by! current_user
    # spawn another process
    # send email
    PhotoMailer.notify_likes(@vote).deliver_later
  end

  def unlike
    @photo = Photo.find params[:id]
    @photo.unliked_by! current_user
    render 'like'
  end
end
