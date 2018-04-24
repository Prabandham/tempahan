class AlterColumnTimeSlotInReservations < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :time_slot, :string
  end
end
