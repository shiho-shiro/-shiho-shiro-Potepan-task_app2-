class ReservationsController < ApplicationController
  before_action :set_current_user

  def index
    #予約済みの部屋を表示
    @reservations = Reservation.all
  end
  def new
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id

    if @reservation.check_in.nil? || @reservation.check_out.nil?
      redirect_to @reservation.room, notice: "日付を指定してください。"
    elsif @reservation.check_out < Date.today || @reservation.check_in < Date.today
      redirect_to @reservation.room, notice: "今日より過去の日付は指定できません。"
    elsif @reservation.check_out == @reservation.check_in
      redirect_to @reservation.room, notice: "同じ日付は指定できません。"
    elsif @reservation.check_out < @reservation.check_in
      redirect_to @reservation.room, notice: "チェックインより後の日付を指定してください。"
    elsif @reservation.customer == nil
      redirect_to @reservation.room, notice: "人数を指定してください。"
    else
    @reservation.total_days = @reservation.amount_days.to_i
    @reservation.total_amount = @reservation.amount_price.to_i
    end
  end

  def create
    #入力画面
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @room = Room.find(params[:id])
    @reservation.room_id = @room.id

  end


  def complete
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    redirect_to :reservations
    flash[:notice] = "予約が完了しました"

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
