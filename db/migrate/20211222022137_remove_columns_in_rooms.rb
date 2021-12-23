class RemoveColumnsInRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :checkin, :date
    remove_column :rooms, :checkout, :date
    remove_column :rooms, :member , :integer
    remove_column :rooms, :room_image_id, :string
  end
end
