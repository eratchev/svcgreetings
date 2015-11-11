require 'sinatra/base'
require 'sinatra/contrib/all'
require 'sinatra/health'


class ApplicationController < Sinatra::Base
  register Sinatra::Contrib
  register Sinatra::Health

  set :service_name, 'greetings'
end