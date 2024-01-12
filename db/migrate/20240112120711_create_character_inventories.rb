class CreateCharacterInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :character_inventories do |t|
      t.references :character, null: false, foreign_key: true
      t.integer :money

      t.timestamps
    end
  end
end
