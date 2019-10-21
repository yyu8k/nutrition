class CreateEventFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :event_foods do |t|

      t.timestamps
    end
  end
end
