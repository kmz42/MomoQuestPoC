class AdventureJob < ApplicationJob
  queue_as :default

  def perform(*args)
    character = args[0]
  
    #
    # Adventure intro
    #
    msg("You head out into Wolfgang's Lair")

    #
    # Meat of the adventure
    #
    # msg('Unimplemented, setting your character state back to idle')
    done = false
    while not done
      # Sleep
      sleep 3

      # Get a random event
      adventure_event = pick_adventure_event
      event = adventure_event.event

      # Process that event
      logs = event.process(character)
      for log in logs
        msg(log)
      end

      # Update state
      puts 'saving character'
      character.save!
      done = adventure_event.completes_adventure?
      puts 'beginning next loop'
    end

    #
    # Adventure outro
    #
    msg('You return victorious from your adventure!')

    # Set character out of adventure TODO
    character.update!(status: Character::STATUS_IDLE)
  end

  def msg(inp)
    ch.send_message inp

    # A dramatic pause between every bot message
    sleep 0.3
  end

  def ch
    @ch ||= bot.group_channel(1194006768599191584)
  end

  def bot
    @bot ||= MomoQuest::Bot.instance.bot
  end

  def pick_adventure_event
    adventure_events = AdventureEvent.where(adventure: Adventure.first)
    
    total_weight = 0
    for adventure_event in adventure_events do
      total_weight = total_weight + adventure_event.weight
    end

    weight = rand(total_weight)

    puts ('DEBUG: weight is' + weight.to_s + ' and total weight is ' + total_weight.to_s)
    
    for adventure_event in adventure_events do
      weight = weight - adventure_event.weight
      if weight <= 0
        return adventure_event
      end
    end

    # This is a bug
    puts "Fix your dang algorithm"
    # TODO
    return AdventureEvent.first
  end
end
