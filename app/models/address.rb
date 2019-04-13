class Address < ApplicationRecord
  belongs_to :company

  validates :address, presence: true
end
