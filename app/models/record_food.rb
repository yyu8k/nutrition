class RecordFood < ApplicationRecord
  belongs_to :record
  belongs_to :food
end
