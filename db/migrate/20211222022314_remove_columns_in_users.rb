class RemoveColumnsInUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :user_image_id, :string
  end
end
