class Reservation < ApplicationRecord
	belongs_to :room
	belongs_to :user


	validates :check_in, presence: true
	validates :check_out, presence: true
	validates :customer, numericality: true

	def amount_days
		self.total_days = (self.check_out - self.check_in).to_i
	end
	def amount_price
		self.total_amount = self.room.price.to_i * self.customer.to_i * amount_days
	end

end
