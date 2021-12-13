class ReservationsController < ApplicationController
  before_action :set_current_user

  def index
    #予約済みの部屋を表示
    @reservations = Reservation.all
  end

  def new
  end


  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @price = Room.find(params[:price])
    @room_price = @price.reservations
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
