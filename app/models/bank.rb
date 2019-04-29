class Bank < Company
  has_many :bank_accounts, dependent: :delete_all
  has_many :clients, through: :bank_accounts

  validates :bik, :correspondent_account, presence: true
  validates :correspondent_account, length: { is: 20 }
end
