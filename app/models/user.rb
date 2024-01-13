class User < ApplicationRecord

    def self.register_or_find_user(discord_id)
        unless User.exists?(discord_id: discord_id)
            User.new(discord_id: discord_id).save!
        end

        User.find_by(discord_id: discord_id)
    end
end
