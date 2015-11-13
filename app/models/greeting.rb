require 'sinatra/activerecord'

class Greeting < ActiveRecord::Base
  validates_presence_of :message

end