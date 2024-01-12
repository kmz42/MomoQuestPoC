json.extract! event, :id, :type, :name, :description, :enemy_id, :gold_found, :created_at, :updated_at
json.url event_url(event, format: :json)
