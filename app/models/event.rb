class Event < ApplicationRecord
  belongs_to :enemy, optional: true
end
