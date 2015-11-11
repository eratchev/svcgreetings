
require_relative '../spec_helper'
require_relative '../../app/controllers/greetings_controller'

describe 'Greetings Service' do

  def app
    GreetingsController
  end

  describe 'GET /' do
    before { get '/' }

    it 'is successful' do
      expect(last_response.status).to eq 200
    end

    it 'returns greetings' do
      expect(last_response.body).to eq('Hello World!')
    end

  end
end