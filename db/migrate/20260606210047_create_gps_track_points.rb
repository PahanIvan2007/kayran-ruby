class CreateGpsTrackPoints < ActiveRecord::Migration[8.1]
  def change
    create_table :gps_track_points do |t|
      t.references :track, null: false, foreign_key: { to_table: :gps_tracks }
      t.datetime :timestamp
      t.decimal :lat, precision: 10, scale: 7
      t.decimal :lng, precision: 10, scale: 7
      t.float :speed
      t.float :accuracy
      t.float :battery_level

      t.timestamps
    end
  end
end
