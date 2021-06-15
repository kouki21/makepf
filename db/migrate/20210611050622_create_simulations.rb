class CreateSimulations < ActiveRecord::Migration[5.2]
  def change
    create_table :simulations do |t|
      t.integer :target_amount
      t.integer :target_days

      t.timestamps
    end
  end
end
