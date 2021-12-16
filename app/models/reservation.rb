class Reservation < ApplicationRecord
	belongs_to :room
	belongs_to :user


	validates :check_in, presence: true
	validates :check_out, presence: true
	validates :customer, numericality: true
	validates :customer, length:{minimum:0}
	validate :check_in_and_check_out

	def amount_days
		self.total_days = (self.check_out - self.check_in).to_i
	end
	def amount_price
		self.total_amount = self.room.price.to_i * self.customer.to_i * amount_days
	end

	def check_in_and_check_out
		errors.add(:check_out,"開始日より前開始日より前の日付は登録できません。")
		if self.check_in.nil? || self.check_in < Date.today
		end
		if self.check_out.nil? || self.check_out < Date.today
		end
		if self.check_in > self.check_out
		end
	end
end
