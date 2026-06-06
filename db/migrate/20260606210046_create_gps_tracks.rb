class CreateGpsTracks < ActiveRecord::Migration[8.1]
  def change
    create_table :gps_tracks do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :status

      t.timestamps
    end
  end
end
