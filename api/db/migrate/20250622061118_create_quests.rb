class CreateQuests < ActiveRecord::Migration[7.0]
  def change
    create_table :quests do |t|
      t.string :name
      t.text :description
      t.string :badge_icon_path

      t.timestamps
    end
  end
end
