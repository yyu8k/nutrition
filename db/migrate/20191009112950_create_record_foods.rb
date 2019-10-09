class CreateRecordFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :record_foods do |t|
      t.references :record, foreign_key: true
      t.references :food, foreign_key: true
      t.timestamps
    end
  end
end
