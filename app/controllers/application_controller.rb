require 'sinatra/base'
require 'sinatra/health'
require 'sinatra/activerecord'


class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::ConfigFile
  register Sinatra::Health

  set :service_name, 'greetings'
  config_file '../../config/*.erb'



  Sidekiq.configure_server do |config|
    config.redis = { url: settings.redis_url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: settings.redis_url }
  end

end