require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should belong_to :legal_form }
  it { should have_one(:legal_address).dependent(:destroy) }
  it { should have_many(:payment_accounts).through(:bank_accounts) }
  it { should have_many(:bank_accounts).dependent(:delete_all) }
  it { should have_and_belong_to_many(:admins).class_name('User') }


  %i[inn kpp name phone ogrn admins].each do |attr|
    it { should validate_presence_of attr }
  end

  %i[inn kpp ogrn].each do |attr|
    it { should validate_length_of attr }
  end
end
