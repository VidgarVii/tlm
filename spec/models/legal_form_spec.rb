require 'rails_helper'

RSpec.describe LegalForm, type: :model do
  it { should have_many :companies }
  it { should validate_presence_of :less_title }
  it { should validate_presence_of :title }
end
