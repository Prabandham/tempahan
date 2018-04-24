require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it 'should validate presence of phone' do
    restaurant = build(:restaurant, :no_phone)
    expect(restaurant.valid?).to eq(false)
  end

  it 'should validate format of phone' do
    restaurant = build(:restaurant, :invalid_phone_number)
    expect(restaurant.valid?).to eq(false)
    expect(restaurant.errors.messages[:phone]).to eq(['is invalid'])
  end

  it 'should save a valid record' do
    restaurant = build(:restaurant, :valid_record)
    expect(restaurant.save).to eq(true)
  end
end
