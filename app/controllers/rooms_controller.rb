class RoomsController < ApplicationController
  before_action :set_current_user , {only: [:show]}
  def index
    @rooms = Room.all

  end
  def new
    @room = Room.new
  end
  def create
    @room = Room.new(params.require(:room).permit(:name,:introduction,:address,:price,:room_image))
    @room.user_id = current_user.id

    if @room.save

      flash[:notice] = "部屋の登録が完了しました"
      redirect_to :rooms
    else
      render "new"
    end
  end
  def show
#自分が登録したルームを表示させる
   @rooms = Room.all
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
