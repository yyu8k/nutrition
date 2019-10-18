class Record < ApplicationRecord
  has_many :record_foods
  has_many :foods, through: :record_foods, dependent: :destroy
end
