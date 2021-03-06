class FeedbackMailer < ActionMailer::Base
  def submit_feedback(user, feedback)
    @user = user
    @feedback = feedback

    mail to: ENV['FEEDBACK_EMAIL'] || 'feedback@example.com',
         reply_to: @user.email
  end
end
