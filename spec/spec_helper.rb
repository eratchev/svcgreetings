ENV['RACK_ENV'] ||= 'test'
require 'rack/test'

RSpec.configure do |config|
  config.include Rack::Test::Methods

end