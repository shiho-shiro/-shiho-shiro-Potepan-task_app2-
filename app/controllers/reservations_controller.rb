class ReservationsController < ApplicationController
  before_action :set_current_user

  def index
    #予約済みの部屋を表示
    @reservations = Reservation.all
  end
  def new
    @reservation = Reservation.new(reservation_params)
    if @reservation.invalid?
      render "rooms/show"
      flash[:notice] = "必須項目です"
    else
    @reservation.total_days = @reservation.amount_days.to_i
    @reservation.total_amount = @reservation.amount_price.to_i
    end
  end

  def create
    #入力画面
    @reservation = Reservation.new(reservation_params)

  end

  def complete
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "予約が完了しました"
    else
      render "new"
    end
  end

  def edit
  end

  def update

  end

  def destroy
  end

  private
    def reservation_params
      params.require(:reservation).permit(:user_id, :check_in, :check_out, :customer, :room_id, :total_days, :total_amount)
    end



end
