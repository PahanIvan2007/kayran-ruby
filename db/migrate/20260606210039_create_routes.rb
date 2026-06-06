class CreateRoutes < ActiveRecord::Migration[8.1]
  def change
    create_table :routes do |t|
      t.string :title
      t.text :description
      t.integer :difficulty
      t.float :distance_km
      t.integer :estimated_duration
      t.integer :route_type
      t.integer :status

      t.timestamps
    end
  end
end
