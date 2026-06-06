class CreateBoats < ActiveRecord::Migration[8.1]
  def change
    create_table :boats do |t|
      t.references :point, null: false, foreign_key: true
      t.string :serial_number
      t.string :color
      t.string :boat_type
      t.integer :capacity
      t.integer :status
      t.integer :condition_level
      t.date :last_service_date

      t.timestamps
    end
  end
end
