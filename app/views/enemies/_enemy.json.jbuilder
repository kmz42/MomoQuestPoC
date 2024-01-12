json.extract! enemy, :id, :name, :hp, :power, :xp_on_defeat, :gold_on_defeat, :created_at, :updated_at
json.url enemy_url(enemy, format: :json)
