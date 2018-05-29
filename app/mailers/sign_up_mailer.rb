class SignUpMailer < ApplicationMailer
default from: "from@example.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Chapter')
  end

end
