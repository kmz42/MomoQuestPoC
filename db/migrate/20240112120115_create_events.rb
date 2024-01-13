class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :kind
      t.string :name
      t.string :description
      t.references :enemy, foreign_key: true
      t.integer :gold_found

      t.timestamps
    end
  end
end
