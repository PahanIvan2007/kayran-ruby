class CreatePayments < ActiveRecord::Migration[8.1]
  def change
    create_table :payments do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :amount
      t.string :currency
      t.string :payment_provider
      t.integer :payment_status
      t.string :external_transaction_id

      t.timestamps
    end
  end
end
