class CreateRentals < ActiveRecord::Migration[8.1]
  def change
    create_table :rentals do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :boat, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :payment_id
      t.integer :status

      t.timestamps
    end
  end
end
