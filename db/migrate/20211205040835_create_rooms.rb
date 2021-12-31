class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :introduction
      t.integer :price
      t.string :address
      t.date :checkin
      t.date :checkout
      t.integer :member

      t.timestamps
    end
  end
end
