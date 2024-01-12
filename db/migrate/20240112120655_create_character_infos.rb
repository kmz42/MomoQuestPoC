class CreateCharacterInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :character_infos do |t|
      t.references :character, null: false, foreign_key: true
      t.integer :level
      t.integer :experience
      t.integer :hp
      t.integer :coziness
      t.integer :fluffiness
      t.integer :sleepiness

      t.timestamps
    end
  end
end
