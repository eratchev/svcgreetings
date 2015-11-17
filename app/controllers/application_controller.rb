require 'sinatra/base'
require 'sinatra/health'
require 'sinatra/activerecord'


class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::ConfigFile
  register Sinatra::Health

  set :service_name, 'greetings'
  config_file '../../config/*.erb'

end