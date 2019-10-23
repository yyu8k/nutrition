class Food < ApplicationRecord
  has_many :event_foods
  has_many :events, through: :event_foods
end
