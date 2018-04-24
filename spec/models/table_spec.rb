require 'rails_helper'

RSpec.describe Table, type: :model do
  let(:restaurant) { create :restaurant, :valid_record }
  it 'should validate required fields' do
    expect(Table.new.valid?).to eq(false)
  end

  it 'should save a valid record' do
    table = build(:table, :invalid_record)
    table.restaurant_id = restaurant.id
    expect(table.valid?).to eq(false)
  end
end
