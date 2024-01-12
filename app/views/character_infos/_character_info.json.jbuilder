json.extract! character_info, :id, :character_id, :level, :experience, :hp, :coziness, :fluffiness, :sleepiness, :created_at, :updated_at
json.url character_info_url(character_info, format: :json)
