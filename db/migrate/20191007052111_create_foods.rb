class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string       :name
      t.integer      :kcal
      t.integer      :protein
      t.integer      :lipid
      t.integer      :carbo
      t.timestamps
    end
  end
end
