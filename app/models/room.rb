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
end