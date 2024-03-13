class Owner::ClotheTransactionsController < ApplicationController
  def index
    user = current_user
    @locations = ClotheTransaction.where(status: ["new", "pending"], client_id: user.id)
    shares = ClotheTransaction.where(status: ["new", "pending"])
    @my_shares = []
    shares.each do |share|
      @my_shares << share if share.clothe.owner == user
    end
    @location_finished = ClotheTransaction.where(status: "finished", client_id: user.id)
    share_finished = ClotheTransaction.where(status: "finished")
    @my_share_finished = []
    share_finished.each do |share|
      @my_share_finished << share if share.clothe.owner == user
    end
  end

  def show
    @transaction = ClotheTransaction.find(params[:id])
  end

  def manage
  end
end
