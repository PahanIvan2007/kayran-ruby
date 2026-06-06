class CreateRoutePoints < ActiveRecord::Migration[8.1]
  def change
    create_table :route_points do |t|
      t.references :route, null: false, foreign_key: true
      t.integer :order_index
      t.decimal :lat
      t.decimal :lng
      t.string :title
      t.string :description
      t.integer :checkpoint_type

      t.timestamps
    end
  end
end
