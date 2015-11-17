require 'spec_helper'

RSpec.describe GreetingsWorker do

  describe '#perform' do
    before 'creates a greeting' do
      expect{
        GreetingsWorker.new.perform({ :message => 'hello3' })
      }.to change(Greeting,:count).by(1)
    end

    it 'creates a greeting' do
      expect(Greeting.all.last.message).to eq('hello3')
    end
  end

  describe '#perform with invalid data' do
    it 'fails' do
      expect{
        GreetingsWorker.new.perform({ :message => '' })
      }.to raise_exception(ActiveRecord::RecordInvalid)
    end

  end


end