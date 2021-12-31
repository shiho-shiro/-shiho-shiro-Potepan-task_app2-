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

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end
end