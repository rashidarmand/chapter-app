class NextChapterMailer < ApplicationMailer
    default from: "chapterbookworms@gmail.com"

    def next_chapter(user,chapter)
        @user = user
        @chapter = chapter
        mail(to: @user.email, subject: 'Your next Chapter!')
      end
    
    
end
