require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should belong_to :legal_form }
  it { should have_one(:legal_address).dependent(:destroy) }
  it { should have_many(:payment_accounts).through(:bank_accounts) }
  it { should have_many(:bank_accounts).dependent(:delete_all) }

  %i[inn kpp name phone ogrn].each do |attr|
    it { should validate_presence_of attr }
  end

  %i[inn kpp ogrn].each do |attr|
    it { should validate_length_of attr }
  end
end
