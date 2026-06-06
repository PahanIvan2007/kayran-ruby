class CreateMatches < ActiveRecord::Migration[8.1]
  def change
    create_table :matches do |t|
      t.references :event, null: false, foreign_key: true
      t.references :tournament, null: true, foreign_key: true
      t.references :team_a, null: true, foreign_key: { to_table: :teams }
      t.references :team_b, null: true, foreign_key: { to_table: :teams }
      t.references :judge, null: true, foreign_key: { to_table: :users }
      t.datetime :start_time
      t.datetime :end_time
      t.integer :score_a
      t.integer :score_b
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
