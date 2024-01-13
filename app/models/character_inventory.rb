class CharacterInventory < ApplicationRecord
  belongs_to :character

  def self.create_new_character_inventory(character_id)
    CharacterInventory.new(character_id: character_id, money: 0).save!
  end
end
