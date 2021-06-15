class CreateObjectiveComments < ActiveRecord::Migration[5.2]
  def change
    create_table :objective_comments do |t|
      t.integer :objective_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
