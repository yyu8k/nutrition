class Event < ApplicationRecord
  has_many :event_foods
  has_many :foods, through: :event_foods, dependent: :destroy
end
