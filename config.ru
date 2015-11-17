require 'rubygems'
require 'bundler'
require 'sinatra/base'

ENV['RACK_ENV'] ||= 'development'
Bundler.require :default, ENV['RACK_ENV'].to_sym


# pull in the helpers and controllers
Dir.glob('./app/{models,helpers,controllers,workers}/*.rb').each { |file| require file }

# map the controllers to routes
map('/sidekiq') { run Sidekiq::Web }
map('/') { run ApplicationController }
map('/greetings') { run GreetingsController }
