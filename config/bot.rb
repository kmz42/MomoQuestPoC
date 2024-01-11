module MomoQuest
    class Bot
        def initialize
            bot = Discordrb::Bot.new token: ENV['DISCORD_TOKEN'],
            client_id: ENV['DISCORD_CLIENT_ID'],
            intents: %i[servers server_messages]

            bot.message(content: '!ping') do |event|
                event.respond 'Pong!'
            end

            bot.run
        end
    end
end