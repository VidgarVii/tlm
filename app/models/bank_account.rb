class BankAccount < ApplicationRecord
  belongs_to :bank,   class_name: 'Bank',    foreign_key: 'bank_id'
  belongs_to :client, class_name: 'Company', foreign_key: 'company_id'

  validates :settlement_account, presence: true, length: { is: 20 }
end
