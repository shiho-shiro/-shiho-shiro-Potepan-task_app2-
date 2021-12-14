class ReservationsController < ApplicationController
  before_action :set_current_user

  def index
    #予約済みの部屋を表示
    @reservations = Reservation.all
  end
  def new
    @reservation = Reservation.new(reservation_params)
    @reservation.total_days = @reservation.amount_days
    @reservation.total_amount = @reservation.amount_price
  end

  def show
  end

  def create
    #入力画面
    @reservation = Reservation.new(reservation_params)
  end

  def show
  end

  private
    def reservation_params
      params.require(:reservation).permit(:user_id, :check_in, :check_out, :customer, :room_id)
    end

  def edit
  end

  def update
  end

  def destroy
  end

end
