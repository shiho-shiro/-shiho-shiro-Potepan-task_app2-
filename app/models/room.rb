class Room < ApplicationRecord
	has_many :resevations
	belongs_to :user
end