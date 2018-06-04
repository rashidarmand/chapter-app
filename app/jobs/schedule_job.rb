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
      chapter = FindChapterJob.new
      User.all.each do |user|
      
      if user[:time_preference] == key

        @@hashbrown[key].push([user, chapter.perform(user)])
      end
      end
      
    end
    p @@hashbrown
    
  end

end
