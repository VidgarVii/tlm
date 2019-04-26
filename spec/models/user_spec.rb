require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :employers }
  it { should have_many(:companies).through(:employers) }
end
