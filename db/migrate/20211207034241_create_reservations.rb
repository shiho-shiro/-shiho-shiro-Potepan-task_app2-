class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :room_id
      t.date :check_in
      t.date :check_out
      t.integer :customer
      t.integer :total_days
      t.integer :total_amount

      t.timestamps
    end
  end
end
