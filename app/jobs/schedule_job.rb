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
    p "HELLO I AM WORKING HALLELUJAH"
  end
end
