class ChangeImageIdType < ActiveRecord::Migration[5.2]
  def change
    change_column :objectives, :image_id, :string
  end
end
