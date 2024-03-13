class ChatroomsController < ApplicationController
  def index
    # raise
    # je veux récuper les chatrooms de toutes mes transaction.
    # j'ai besoin d'avoir mes transaction
    @chatrooms = current_user.transactions.map(&:chatroom).reject(&:nil?)
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
