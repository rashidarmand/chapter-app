class SendMailJob < ApplicationJob
  queue_as :default

  def perform
    User.all.each do |unique|
      p unique
    NewChapterMailer.new_chapter(unique).deliver
    end
  end
end
