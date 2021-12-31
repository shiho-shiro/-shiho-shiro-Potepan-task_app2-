class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:search]
  def index
    @rooms = Room.all.page(params[:page]).per(5)
    @user = current_user
  end
  def new
    @user = current_user
    @room = Room.new
  end
  def create
    @room = Room.new(params.require(:room).permit(:name,:introduction,:address,:price,:image))
    @room.user_id = current_user.id
    @user = current_user
    if @room.save
      redirect_to :rooms
      flash[:notice] = "部屋の登録が完了しました"
    else
      render "new"
    end
  end

  def search
    @user = current_user
    @rooms = Room.search(params[:search])

  end

  def show
#自分が登録したルームを表示させる
   @user = current_user
   @room = Room.find(params[:id])
   @room.user_id = current_user.id
   @reservation = Reservation.new
   @reservation.room_id = @room.id

  end

  def edit
  end

  def update
  end

  def destroy

  end
end
