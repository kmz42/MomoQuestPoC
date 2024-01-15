class Event < ApplicationRecord
  belongs_to :enemy, optional: true

  def process(character)
    case kind
    when 'EnemyEvent'
      process_enemy_event(character)
    when 'TreasureEvent'
      process_treasure_event(character)
    when 'FluffEvent'
      process_fluff_event(character)
    end
  end

  def process_enemy_event(character)
    log = []
    log.push("While exploring, you suddenly encounter #{enemy.name}, and prepare to do battle")
    log.push("You begin combat with #{character.hp} courage. #{enemy.name} has #{enemy.hp} courage.")

    # Begin a combat with the enemy
    # TODO refactor to another class
    their_hp = enemy.hp

    while their_hp > 0
      # Their attack
      log.push("The #{enemy.name} barks at you!")
      character.hp -= enemy.power
      log.push("Your courage decreases by #{enemy.power}. You have #{character.hp} courage remaining.")

      unless character.hp > 0
        break
      end

      # Your attack
      # TODO change how stats work
      log.push("You paw at #{enemy.name}")
      their_hp -= character.character_info.fluffiness
      log.push("Their courage decreases by #{character.fluffiness}. They have #{their_hp} courage remaining.")
    end

    # Update character state for win
    if character.hp > 0
      log.push("#{enemy.name} runs with its tail between its legs. You are victorious!")
      log.push("You find #{enemy.gold_on_defeat} gold and gain #{enemy.xp_on_defeat} experience points")
      log.push("You have #{character.character_info.hp} points of courage remaining")
      character.character_info.experience += enemy.xp_on_defeat
      character.character_inventory.money += enemy.gold_on_defeat
      # TODO: add leveling up
    else # lose
      log.push("Your courage depleted, you run away in fear!")
      character.is_alive = false
      character.character_info.hp = 0
    end

    return log
  end

  def process_treasure_event(character)
    log = []

    log.push('While exploring, you discover a stash of treasure!')
    log.push(description)
    log.push("You gain #{gold_found} gold")
    character.character_inventory.money += gold_found

    return log
  end

  def process_fluff_event(character)
    log = []

    log.push(description)

    return log
  end
end
