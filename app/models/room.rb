class Room < ApplicationRecord
	has_many :reservations,dependent: :destroy
	belongs_to :user

	validates :name, presence: true
	validates :introduction, presence: true
	validates :introduction, length: {maximum: 30}
	validates :price, numericality: true
	validates :address, presence: true
	validates :image, presence: true

	has_one_attached :image

	def self.search(search)
		if search
			Room.where(['name LIKE ? OR address LIKE ? OR introduction LIKE ? ', "%#{search}%", "%#{search}%", "%#{search}%"])
		else
		  Room.all
		end
	end

end