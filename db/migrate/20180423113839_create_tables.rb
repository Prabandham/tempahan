class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :minimum_capity
      t.integer :maximum_capacity
      t.references :restaturant, foreign_key: true

      t.timestamps
    end
  end
end
