class UsersController < ApplicationController
    before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # エントリーテーブルにデータがなかったら作るっていう処理
    # 自分のid
    currentUserEntry = Entry.where(user_id: current_user.id)
    # 対象のid
    userEntry=Entry.where(user_id: @user.id)

    # 対象が自分以外のとき
    unless @user.id == current_user.id
      # 自分のidと対象のidが一致するかloopで確認
      currentUserEntry.each do |cu|
        userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end

      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
end