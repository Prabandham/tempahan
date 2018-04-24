require 'rails_helper'

RSpec.describe Shift, type: :model do
  let(:restaurant) { create(:restaurant, :valid_record)}

  it 'should not save an invalid shift' do
    shift = build(:shift, :invalid_start_and_end_times)
    shift.restaurant_id = restaurant.id
    expect(shift.valid?).to eq(false)
  end

  it 'should save a valid shift' do
    shift = build(:shift, :valid_start_and_end_times)
    shift.restaurant_id = restaurant.id
    expect(shift.valid?).to eq(true)
  end
end
