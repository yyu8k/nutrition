class CreateEventFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :event_foods do |t|
      t.references :event, foreign_key: true
      t.references :food, foreign_key: true
      t.timestamps
    end
  end
end
