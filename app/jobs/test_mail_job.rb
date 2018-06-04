class TestMailJob < ApplicationJob
  queue_as :default

  def perform
    p "AYYYOOOOO"
  end
end
