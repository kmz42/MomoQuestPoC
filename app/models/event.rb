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
    return ['TODO: unimplemented event with enemy: ' + enemy.name]
  end

  def process_treasure_event(character)
    log = []

    log.push('While exploring, you discover a stash of treasure!')
    # log.push(description)
    # log.push
    return log
  end

  def process_fluff_event(character)
    return ['TODO: unimplemented fluff event: ' + name]
  end
end
