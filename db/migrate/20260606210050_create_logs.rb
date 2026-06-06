class CreateLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :logs do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :action_type
      t.string :entity_type
      t.string :entity_id
      t.text :payload

      t.timestamps
    end
  end
end
