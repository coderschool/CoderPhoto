class PhotoMailer < ApplicationMailer
  def notify_likes(photo, user)
    @photo = photo
    @user  = user
    mail(to: @user, subject: "Your photo has been liked!")
  end
end
