require 'sinatra/base'
# require 'sinatra/contrib/all'
require 'sinatra/health'
require 'sinatra/activerecord'


class ApplicationController < Sinatra::Base
  # register Sinatra::Contrib
  register Sinatra::ActiveRecordExtension
  register Sinatra::Health

  set :service_name, 'greetings'
end