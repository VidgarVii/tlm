require 'rails_helper'

describe Account, type: :model do
  it { should have_many :employers }
  it { should have_many(:companies).through(:employers) }
end
