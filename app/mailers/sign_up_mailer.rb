class SignUpMailer < ApplicationMailer
default from: "info@chapter-app.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Chapter !')
  end

end
