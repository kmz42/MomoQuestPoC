class CreateEnemies < ActiveRecord::Migration[7.1]
  def change
    create_table :enemies do |t|
      t.string :name
      t.integer :hp
      t.integer :power
      t.integer :xp_on_defeat
      t.integer :gold_on_defeat

      t.timestamps
    end
  end
end
