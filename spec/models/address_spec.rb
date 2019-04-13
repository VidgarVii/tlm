require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should belong_to :company }
  it { should validate_presence_of :address }
end
