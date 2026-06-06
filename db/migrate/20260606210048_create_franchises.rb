class CreateFranchises < ActiveRecord::Migration[8.1]
  def change
    create_table :franchises do |t|
      t.string :title
      t.references :owner, null: true, foreign_key: { to_table: :users }
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
