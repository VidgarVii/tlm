FactoryBot.define do
  sequence :email do |n|
    "test#{n}@mail.ru"
  end

  factory :account do
    email
    password { 'qwerty' }
    password_confirmation { 'qwerty' }

    # before(:create) {|user| user.skip_confirmation! }
  end
end
