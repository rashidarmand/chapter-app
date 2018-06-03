class ScheduleJob < ApplicationJob
  queue_as :default
 
  @@start = 0
  @@hashbrown = {}

  public def initialize
    while(@@start < 1440) do
      @@hashbrown[@@start]=[]
      @@start = @@start+15
    end
  end

  public def hashbrown
    @@hashbrown
  end

  def perform
    @@hashbrown.each do |key,value|
      User.find_by(time_preference:key).each do |user|
        step1 = UserBook.find_by(user_id: user.id, priority: 1)
        step2 = Chapter.where(book_id: step1.book_id)
        step3 = 

        @@hashbrown[key].push([user, chapter])
      end
      end
      
    end
    @@hashbrown
    
  end

end
