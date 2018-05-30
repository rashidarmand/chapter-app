class NewChapterMailer < ApplicationMailer
        default from: "chapterbookworms@gmail.com"
        
          def new_chapter(user)
            @user = user
            mail(to: @user.email, subject: 'Your next Chapter!')
          end
        
        
        
end

