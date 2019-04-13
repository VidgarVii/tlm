require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  it { should belong_to(:bank).class_name('Bank') }
  it { should belong_to(:client).class_name('Company') }

  it { should validate_presence_of :settlement_account }
  it { should validate_length_of :settlement_account }
end
