class Owner::TransactionsController < ApplicationController
  def index
    user = current_user
    @locations = Transaction.where(status: ["new", "pending"], client_id: user.id)
    shares = Transaction.where(status: ["new", "pending"])
    @my_shares = []
    shares.each do |share|
      @my_shares << share if share.clothe.owner == user
    end
    @location_finished = Transaction.where(status: "finished", client_id: user.id)
    share_finished = Transaction.where(status: "finished")
    @my_share_finished = []
    share_finished.each do |share|
      @my_share_finished << share if share.clothe.owner == user
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def manage
  end
end
