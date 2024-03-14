class ChatroomsController < ApplicationController
  def index
    # raise
    # je veux récuper les chatrooms de toutes mes transaction.
    # j'ai besoin d'avoir mes transaction
    @renter_chatrooms = current_user.clothe_transactions.map(&:chatroom).reject(&:nil?)
    @owner_chatrooms = Chatroom.includes(:clothes).where(clothes: { owner: current_user})
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  # def destroy
  #   @chatroom = @restaurant = Chatroom.find(params[:id])
  #   @chatroom.destroy
  #   # redirect_to restaurants_path, status: :see_other
  # end

end
