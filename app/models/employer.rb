class Employer < ApplicationRecord
  belongs_to :user
  belongs_to :company

  enum post: %i[director manager buhgalter urist driver]
end
