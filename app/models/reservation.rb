class Reservation < ApplicationRecord
	belongs_to :room
	belongs_to :user

	def amount_days
		self.total_days = (self.check_out - self.check_in).to_i
	end
	def amount_price
		self.total_amount = @room_price * self.customer * amount_days
	end
end
