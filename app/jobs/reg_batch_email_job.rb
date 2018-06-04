class RegBatchEmailJob < ApplicationJob
  queue_as :default

  def perform(data)
    
        NextChapterMailer.next_chapter(data[0],data[1]).deliver

      
    
  end
end
    