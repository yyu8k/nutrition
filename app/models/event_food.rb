class EventFood < ApplicationRecord
  belongs_to :event
  belongs_to :food
end
