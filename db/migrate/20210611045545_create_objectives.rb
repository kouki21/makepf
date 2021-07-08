class CreateObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :objectives do |t|
      t.integer :user_id
      t.integer :money
      t.string :image_id
      t.text :content
      t.string :title
      t.boolean :is_achievement, default: true
      t.timestamps
    end
  end
end
