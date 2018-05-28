# Preview all emails at http://localhost:3000/rails/mailers/sign_up_mailer
class SignUpMailerPreview < ActionMailer::Preview
    def sample_mail_preview
      SignUpMailer.sample_email(User.first)
    end
end
