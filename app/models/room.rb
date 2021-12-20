class Room < ApplicationRecord
	has_many :reservations,dependent: :destroy
	belongs_to :user

	validates :name, presence: true
	validates :introduction, presence: true
	validates :introduction, length: {maximum: 30}
	validates :price, numericality: true
	validates :address, presence: true
	#validates :room_image, presence: true



end