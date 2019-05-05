FactoryBot.define do
  factory :employer do
    first_name { "MyString" }
    last_name { "MyString" }
    middle_name { "MyString" }
    post { 1 }
    company
  end
end
