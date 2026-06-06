class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.integer :event_type, default: 0
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.references :point, null: true, foreign_key: true
      t.references :route, null: true, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.integer :status, default: 0
      t.integer :visibility, default: 0

      t.timestamps
    end
  end
end
