class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :email
      t.integer :rank
      t.string  :status

      t.timestamps
    end
  end
end
