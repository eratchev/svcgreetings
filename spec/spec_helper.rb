ENV['RACK_ENV'] ||= 'test'
require 'rack/test'

$:.unshift File.expand_path('../../app/controllers', __FILE__)
$:.unshift File.expand_path('../../app/models', __FILE__)
$:.unshift File.expand_path('../../config', __FILE__)

Dir.glob('./app/{models,helpers,controllers}/*.rb').each { |file| require file }

RSpec.configure do |config|
  config.include Rack::Test::Methods

end