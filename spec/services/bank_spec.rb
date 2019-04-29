require 'rails_helper'

RSpec.describe Services::Bank do
  subject { Services::Bank.new }

  it 'response to bank #get' do
    expect(subject.get('049706609')).to be_is_a(Hash)
  end
end
