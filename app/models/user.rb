class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  validates :name, presence: true
  validates :image, presence: true, on: :update
  validates :email, uniqueness: true, presence: true
  validates :password, length:{maximum:10},presence: true,on: :create
  validates :password, confirmation: true

  validates :introduction, presence: true, on: :update


  has_many :reservations, dependent: :destroy
  has_many :rooms , dependent: :destroy

  has_one_attached :image
end