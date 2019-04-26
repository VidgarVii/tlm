class Company < ApplicationRecord
  has_one :legal_address, class_name: 'Address', dependent: :destroy
  has_many :bank_accounts, dependent: :delete_all
  has_many :payment_accounts, through: :bank_accounts, source: :bank
  has_and_belongs_to_many :managers, class_name: 'User'

  belongs_to :legal_form

  validates :inn, :kpp, :name, :ogrn, :phone, presence: true
  validates :kpp,  length: { is: 9 }
  validates :inn,  length: { is: 10 }
  validates :ogrn, length: { is: 13 }
end
