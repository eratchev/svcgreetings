require 'sinatra/base'
require 'sinatra/health'

class ApplicationController < Sinatra::Base
  register Sinatra::Health

end