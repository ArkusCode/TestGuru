class FeedbacksMailer < ApplicationMailer

 def send_feedback(feedback)
    @user = feedback.user
    @feedback = feedback

    mail to: "arkuscode@gmail.com"
  end
end
