require 'test_helper'

class FeedbacksMailerTest < ActionMailer::TestCase
  test "new" do
    mail = FeedbacksMailer.new
    assert_equal "New", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "_form" do
    mail = FeedbacksMailer._form
    assert_equal "Form", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
