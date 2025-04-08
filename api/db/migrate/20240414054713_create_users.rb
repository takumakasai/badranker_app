class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :email
      t.integer :rank
      t.string  :status
      t.string  :display_id
      t.string  :password
      t.string  :play_style
      t.integer  :offense
      t.integer  :defense
      t.integer  :speed
      t.integer  :stability # 安定性
      t.string :special_skill # 必殺技

      t.timestamps
    end
  end
end
