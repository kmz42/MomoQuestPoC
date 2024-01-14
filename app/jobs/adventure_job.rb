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
    msg('Unimplemented, setting your character state back to idle')

    #
    # Adventure outro
    #

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
end
