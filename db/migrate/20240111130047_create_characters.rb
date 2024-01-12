class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :is_alive
      t.string :status

      t.timestamps
    end
  end
end
