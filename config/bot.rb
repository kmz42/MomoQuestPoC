module MomoQuest

    require 'singleton'

    class Bot
        include Singleton
        attr_accessor :bot

        def initialize
            bot = Discordrb::Bot.new token: ENV['DISCORD_TOKEN'],
            client_id: ENV['DISCORD_CLIENT_ID'],
            intents: %i[server_messages]

            # Bot routes
            bot.message(content: '!help') do |event|
                User.register_or_find_user(event.author.id)
                event.respond "MomoQuest version 0.1\nTry !create, !status, and !begin_adventure"
            end

            bot.message(content: '!create') do |event|
                # event.respond "your id is #{event.author.id}"

                user = User.register_or_find_user(event.author.id)

                # event.respond "your id is #{event.author.id}, you are #{user}"

                if Character.exists?(user_id: user.id, is_alive: true)
                    event.respond "You already have a character, try !status"
                else
                    Character.create_new_character(user.id)
                    event.respond "Character created! Try !status to see more"
                end
            end

            bot.message(content: '!begin_adventure') do |event|
                user = User.register_or_find_user(event.author.id)

                unless Character.exists?(user_id: user.id, is_alive: true)
                    event.respond "You need to make a character first! Try !create"
                    return
                end

                character = Character.find_by(user_id: user.id, is_alive: true)

                unless character.status == Character::STATUS_IDLE
                    event.respond "Your character is already busy"
                    return
                end

                if character.update!(status: Character::STATUS_IN_ADVENTURE)
                    # Queue job to kick off adventure
                    AdventureJob.perform_later character
                end
            end

            bot.message(content: '!status') do |event|
                user = User.register_or_find_user(event.author.id)

                unless Character.exists?(user_id: user.id, is_alive: true)
                    event.respond "No active characters"
                    return
                end

                character = Character.find_by(user_id: user.id, is_alive: true)
                inventory = CharacterInventory.find_by(character_id: character.id)
                info = CharacterInfo.find_by(character_id: character.id)

                event.respond "Your character is at level #{info.level}, you have #{inventory.money} gold, your stats are: coziness=#{info.coziness}, fluffiness=#{info.fluffiness}, sleepiness=#{info.sleepiness}. Your courage is at #{info.hp} out of 100."
            end

            @bot = bot
        end

        # TODO using hardcoded channel
        def send_to_general
            ## TODO
        end
    end
end