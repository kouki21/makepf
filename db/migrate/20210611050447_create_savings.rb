class CreateSavings < ActiveRecord::Migration[5.2]
  def change
    create_table :savings do |t|
      t.integer :total
      t.integer :rent
      t.integer :food
      t.integer :waterway_light_heat_fee
      t.integer :life
      t.integer :postage
      t.integer :medical
      t.integer :entertainment
      t.integer :others

      t.timestamps
    end
  end
end
