class Food < ApplicationRecord
  has_many :record_foods
  has_many :records, through: :record_foods
end
