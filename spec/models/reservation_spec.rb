require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:guest) { create(:guest) }
  let(:restaurant) { create(:restaurant, :valid_record) }
  let(:shift) { create(:shift, :valid_start_and_end_times, restaurant_id: restaurant.id) }
  let(:table) { create(:table, :valid_record, restaurant_id: restaurant.id) }

  it 'should not save a reservation if no guest ID is given' do
    reservation_params = { guest_id: nil, restaurant_id: restaurant.id, shift_id: shift.id, table_id: table.id, time_slot: "11:00 AM", guest_count: 2 }
    reservation = Reservation.new(reservation_params)
    reservation.save
    expect(reservation.valid?).to eq(false)
    expect(reservation.errors.messages[:guest]).to eq(["must exist"])
  end

  it 'should not save an invalid time slot' do
    reservation_params = { guest_id: guest.id, restaurant_id: restaurant.id, shift_id: shift.id, table_id: table.id, time_slot: "02:00 PM", guest_count: 2 }
    reservation = Reservation.new(reservation_params)
    reservation.save
    expect(reservation.valid?).to eq(false)
    expect(reservation.errors.messages[:time_slot]).to eq(["Reservation should be between 09:00 AM - 13:00 PM"])
  end

  it 'should not allow more guests and the table can accomodate' do
    reservation_params = { guest_id: guest.id, restaurant_id: restaurant.id, shift_id: shift.id, table_id: table.id, time_slot: "11:00 AM", guest_count: 20 }
    reservation = Reservation.new(reservation_params)
    reservation.save
    expect(reservation.valid?).to eq(false)
    expect(reservation.errors.messages[:guest_count]).to eq(["Should be between 2 - 4"])
  end

  it 'should save a reservation' do
    reservation_params = { guest_id: guest.id, restaurant_id: restaurant.id, shift_id: shift.id, table_id: table.id, time_slot: "11:00 AM", guest_count: 2 }
    reservation = Reservation.new(reservation_params)
    reservation.save
    expect(reservation.valid?).to eq(true)
  end
end
