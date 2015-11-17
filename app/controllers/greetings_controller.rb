require_relative 'application_controller'

class GreetingsController < ApplicationController

  get '/' do
    @greetings = Greeting.all
    json @greetings
  end

  post '/' do
    request.body.rewind
    request_payload = JSON.parse request.body.read
    GreetingsWorker.perform_async(request_payload)
  end

  get '/:id' do
    @greeting = Greeting.find(params[:id])
    json @greeting
  end

end