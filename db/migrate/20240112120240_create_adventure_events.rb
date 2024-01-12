class CreateAdventureEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :adventure_events do |t|
      t.references :adventure, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.boolean :completes_adventure
      t.integer :weight

      t.timestamps
    end
  end
end
