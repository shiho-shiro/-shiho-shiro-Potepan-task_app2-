class AddUserImageIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_image_id, :string
  end
end
