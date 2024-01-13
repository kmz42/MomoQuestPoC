class CharacterInfo < ApplicationRecord
  belongs_to :character

  NEW_CHARACTER_DEFAULTS = {level: 1, experience: 0, hp: 100, coziness: 5, fluffiness: 5, sleepiness: 5}

  def self.create_new_character_info(character_id)
    args = {character_id: character_id}.with_indifferent_access.merge(NEW_CHARACTER_DEFAULTS)
    CharacterInfo.new(args).save!
  end
end
