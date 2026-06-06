class CreatePoints < ActiveRecord::Migration[8.1]
  def change
    create_table :points do |t|
      t.string :title
      t.integer :point_type
      t.references :franchise, null: true, foreign_key: true
      t.string :address
      t.decimal :lat, precision: 10, scale: 7
      t.decimal :lng, precision: 10, scale: 7
      t.string :timezone
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
