class SignUpMailer < ApplicationMailer
default from: "chapterbookworms@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Chapter !')
  end

end
