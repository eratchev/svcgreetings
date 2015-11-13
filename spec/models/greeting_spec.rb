require 'spec_helper'

RSpec.describe Greeting, type: :model do

  it 'should be valid' do
    g = Greeting.new(message: 'hi')
    expect(g.valid?).to be true
  end

  it 'should not be valid' do
    g = Greeting.new(message: '')
    expect(g.valid?).to be false
  end
end