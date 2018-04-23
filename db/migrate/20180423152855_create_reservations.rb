class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :restaurant, foreign_key: true
      t.references :shift, foreign_key: true
      t.references :guest, foreign_key: true
      t.integer :guest_count

      t.timestamps
    end
  end
end
