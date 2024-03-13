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
    markers_maker(@transaction.clothe)
  end

  private

  def markers_maker(clothe)
    my_marker = {
                  lat: current_user.latitude,
                  lng: current_user.longitude
                }
    clothe_marker = {
                      lat: clothe.owner.latitude,
                      lng: clothe.owner.longitude
                    }
    @markers = [my_marker, clothe_marker]
  end
end
