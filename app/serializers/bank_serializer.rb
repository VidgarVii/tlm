class BankSerializer < ActiveModel::Serializer
  attributes %i[name bik correspondent_account]
  has_one :legal_address
end
