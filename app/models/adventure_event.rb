class AdventureEvent < ApplicationRecord
  belongs_to :adventure
  belongs_to :event
end
