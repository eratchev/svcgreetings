require_relative 'application_controller'

class GreetingsController < ApplicationController

  get '/' do
    'Hello World!'
  end

end