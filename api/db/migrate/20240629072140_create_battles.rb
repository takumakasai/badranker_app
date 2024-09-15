class CreateBattles < ActiveRecord::Migration[7.0]
  def change
    create_table :battles do |t|
      t.references :challenger, foreign_key: { to_table: :users }
      t.references :defender, foreign_key: { to_table: :users }
      t.integer :challenger_result_status, null: false
      t.integer :defender_approval_status, null: false

      t.timestamps
    end
  end
end