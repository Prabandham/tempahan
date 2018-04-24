class AddTimeSlotToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :time_slot, :time
  end
end
