require 'test_helper'

class VerifyTest < ActionMailer::TestCase
  test "verifyUser" do
    mail = Verify.verifyUser
    assert_equal "Verifyuser", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
