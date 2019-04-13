require 'rails_helper'

RSpec.describe Bank, type: :model do
  it { should have_many(:clients).through(:bank_accounts) }
  it { should have_many(:bank_accounts).dependent(:delete_all) }

  %i[bik correspondent_account].each do |attr|
    it { should validate_presence_of attr }
  end

  it { should validate_length_of :bik }
  it { should validate_length_of :correspondent_account }
end
