class UserMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def registration_token(user)
    @user = user
    mail(to: @user.email, subject: 'Registration Token')
  end
end
