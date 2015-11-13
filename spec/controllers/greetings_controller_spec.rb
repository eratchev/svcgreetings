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
      expect{
        post '/', body, { 'Content-Type' => 'application/json' }
      }.to change(Greeting,:count).by(1)
    end

    it 'is successful' do
      expect(Greeting.all.last.message).to eq('hello3')
      expect(last_response).to be_redirect
      expect(last_response.location).to include "/greetings/#{Greeting.all.last.id}"
    end
  end

  describe 'POST / with invalid data' do
    let(:body) { { :message => '' }.to_json }
    it 'fails' do
      expect{
        post '/', body, { 'Content-Type' => 'application/json' }
      }.to raise_exception(ActiveRecord::RecordInvalid)
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