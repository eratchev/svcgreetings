require_relative '../models/greeting'

class GreetingsWorker
  include Sidekiq::Worker
  def perform(request_payload)
    @greeting = Greeting.create!(request_payload)
  end
end