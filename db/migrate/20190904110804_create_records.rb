class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.date :date
      t.integer  "food_id"
      t.timestamps
    end
  end
end
