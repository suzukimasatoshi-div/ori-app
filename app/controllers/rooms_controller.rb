class RoomsController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @room = Room.find(params[:item_id])
  end

  def new
    @room = Room.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @room = Room.new(room_params)
    if @room.save
      redirect_to item_rooms_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids:[]).merge(item_id: @item.id)
  end
end
