class Company < ApplicationRecord
  has_one :legal_address, class_name: 'Address', dependent: :destroy
  has_many :bank_accounts, dependent: :delete_all
  has_many :payment_accounts, through: :bank_accounts, source: :bank
  has_many :employers, dependent: :destroy
  has_many :users, through: :employers

  belongs_to :legal_form

  has_one_attached :logo

  validates :inn, :kpp, :name, :ogrn, :phone, presence: true
  validates :kpp,  length: { is: 9 }
  validates :inn,  length: { is: 10 }, uniqueness: true
  validates :ogrn, length: { is: 13 }, uniqueness: true
  validates :logo, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
