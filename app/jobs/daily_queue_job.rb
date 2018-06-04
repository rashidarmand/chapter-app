class DailyQueueJob < ApplicationJob
  queue_as :default

  def perform
    iterate_me = ScheduleJob.new.perform
    iterate_me.each do |key, value|
      value = value.select {|chapter| chapter!= nil}
      value.each do |data|
       RegBatchEmailJob.set(wait: key.seconds).perform_later(data)
      end
    end
  end
end
