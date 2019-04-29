FactoryBot.define do
  sequence :inn do |n|
    1111111111+n
  end

  sequence :ogrn do |n|
    1161691111111+n
  end

  factory :company do
    name { "Company" }
    inn
    kpp { 116169111 }
    ogrn
    # association :legal_address, factory: :address
    legal_form
    phone { 999-111-11-11 }
  end

  trait :bank do
    bik { 111111114 }
    correspondent_account { 30101860500000000608 }
    type { 'Bank' }
  end

  trait :with_address do
    after(:create) { |company| create(:address, address: 'Простоквашино', company: company) }
  end
end
