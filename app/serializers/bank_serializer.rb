class BankSerializer < ActiveModel::Serializer
  attributes %i[id name bik correspondent_account]
  has_one :legal_address
end
