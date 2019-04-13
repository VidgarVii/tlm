class LegalForm < ApplicationRecord
  has_many :companies

  validates :less_title, :title, presence: true
end
