json.extract! adventure_event, :id, :adventure_id, :event_id, :completes_adventure, :weight, :created_at, :updated_at
json.url adventure_event_url(adventure_event, format: :json)
