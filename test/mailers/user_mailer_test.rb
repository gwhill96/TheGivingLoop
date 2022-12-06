require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "redeemed_donation" do
    mail = UserMailer.redeemed_donation(item)
    assert_equal "redeemed_donation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
