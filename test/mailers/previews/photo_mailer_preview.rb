# Preview all emails at http://localhost:3000/rails/mailers/photo_mailer
class PhotoMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/photo_mailer/notify_likes
  def notify_likes
    vote = Vote.first
    PhotoMailer.notify_likes(vote)
  end

end
