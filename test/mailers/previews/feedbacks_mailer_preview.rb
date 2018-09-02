# Preview all emails at http://localhost:3000/rails/mailers/feedbacks_mailer
class FeedbacksMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/feedbacks_mailer/new
  def new
    FeedbacksMailer.new
  end

  # Preview this email at http://localhost:3000/rails/mailers/feedbacks_mailer/_form
  def _form
    FeedbacksMailer._form
  end

end
