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

  def perform(*args)
    # Do something later
  end
end
