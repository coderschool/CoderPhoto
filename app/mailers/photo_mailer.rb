class PhotoMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.photo_mailer.notify_likes.subject
  #
  def notify_likes(vote)
    mail to: "admin@example.com", 
      subject: "#{vote.voter.email} just liked your photo."
  end
end
