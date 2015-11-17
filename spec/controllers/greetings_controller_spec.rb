require 'spec_helper'

describe 'Greetings Service' do

  def app
    GreetingsController
  end

  before do
    Greeting.destroy_all
  end

  describe 'GET /' do
    before do
      Greeting.create(message: 'hello1')
      Greeting.create(message: 'hello2')
      get '/'
    end

    it 'is successful' do
      expect(last_response.status).to eq 200
    end

    it 'returns greetings' do
      greetings = JSON.parse(last_response.body)
      expect(greetings.count).to eq(2)
      expect(greetings[0]['message']).to eq('hello1')
      expect(greetings[1]['message']).to eq('hello2')
    end
  end

  describe 'POST /' do
    let(:body) { { :message => 'hello3' }.to_json }
    before do
      allow(GreetingsWorker).to receive(:perform_async)
      post '/', body, { 'Content-Type' => 'application/json' }
    end

    it 'call worker' do
      expect(GreetingsWorker).to have_received(:perform_async).with({ 'message' => 'hello3' })
    end
  end


  describe 'GET /:id' do
    before do
      @g1 = Greeting.create(message: 'hello1')
      @g2 = Greeting.create(message: 'hello2')
      get "/#{@g2.id}"
    end

    it 'is successful' do
      expect(last_response.status).to eq 200
    end

    it 'returns greeting' do
      greeting = JSON.parse(last_response.body)
      expect(greeting['message']).to eq('hello2')
    end
  end

end