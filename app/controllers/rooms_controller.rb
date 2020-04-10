class RoomsController < ApplicationController
  before_action :authenticate_user!
  def show
    @room = Room.find(params[:id])
    #present?の戻り値は真偽値。よって、trueの場合、
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @chats = @room.chats
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
          # binding.pry
    room = Room.create(:name => "DM")
    Entry.create(:room_id => room.id, :user_id => current_user.id)
    Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => room.id))
    redirect_to room_path(room.id)
  end
end