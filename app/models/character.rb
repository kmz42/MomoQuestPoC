class Character < ApplicationRecord
  belongs_to :user

  STATUS_IDLE = "idle"
  STATUS_IN_ADVENTURE = "in_adventure"
  
  def self.create_new_character(user_id)
    Character.transaction do
      character = Character.new(user_id: user_id, is_alive: true, status: STATUS_IDLE)
      character.save!
      CharacterInventory.create_new_character_inventory(character.id)
      CharacterInfo.create_new_character_info(character.id)
      
      character
    end    
  end
end
