class RoomsController < ApplicationController

  def index
    @rooms = Room.all

  end
  def new
    @room = Room.new
  end
  def create
    @room = Room.new(params.require(:room).permit(:name,:introduction,:address,:price,:image))
    @room.user_id = current_user.id


    if @room.save
      redirect_to :rooms
      flash[:notice] = "部屋の登録が完了しました"
    else
      render "new"
    end
  end

  def search
    if params[:address].present?
      @rooms = Room.where('address LIKE ?', "%#{params[:address]}%")
    else
      @rooms = Room.none
    end
  end

  def show
#自分が登録したルームを表示させる
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
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "削除しました"
    redirect_to :rooms
  end
end
