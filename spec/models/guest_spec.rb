require 'rails_helper'

RSpec.describe Guest, type: :model do
  it "is not valid without name and email" do
    expect(Guest.new).to_not be_valid
  end

  it "is not valid without a proper email" do
    expect(Guest.new(name: "Srinidhi P", email: "test")).to_not be_valid
  end

  it "is valid with proper email" do
    expect(Guest.new(name: "Srinidhi P", email: "prabandham@larks.in")).to be_valid
  end

  context 'Email Validation' do
    it 'should validate unique email' do
      create(:guest)
      guest = Guest.new(name: 'Srinidhi P', email: 'prabandham@larks.in')
      expect(guest.valid?).to eq(false)
    end
  end
end
