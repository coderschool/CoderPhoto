require 'test_helper'

class PhotoMailerTest < ActionMailer::TestCase
  test "notify_likes" do
    mail = PhotoMailer.notify_likes
    assert_equal "Notify likes", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
