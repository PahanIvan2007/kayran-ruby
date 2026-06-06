class CreateTournaments < ActiveRecord::Migration[8.1]
  def change
    create_table :tournaments do |t|
      t.references :event, null: false, foreign_key: true
      t.string :title
      t.integer :format
      t.integer :status

      t.timestamps
    end
  end
end
