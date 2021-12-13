class ReservationsController < ApplicationController
  before_action :set_current_user

  def index
    #予約済みの部屋を表示
    @reservations = Reservation.all
    @room = Room.find(params[:id])

  end

  def new
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @room = Room.find(params[:id])
    @reservation.room_id = @room.id
  end

  def show

  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @room = Room.find(params[:id])
    @reservation.room_id = @room.id
    @reservation.total_days = @reservation.amount_days
    @reservation.total_amount = @reservation.amount_price
    binding.pry
    if @reservation.save

    else
      render "new"
    end
    #入力画面
  end

  def show


  end

  private
    def reservation_params
      params.require(:reservation).permit(:user_id,:room_id,:check_in,:check_out,:customer,:total_days,:total_amount)
    end

  def edit
  end

  def update
  end

  def destroy
  end

end
