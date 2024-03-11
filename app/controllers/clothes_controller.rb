class ClothesController < ApplicationController
  def index
    @clothes = Clothe.where(owner: current_user)
  end

  def show
    @clothe = Clothe.find(params[:id])
    @reservations = @clothe.transactions
    @reservations_dates = []
    @reservations.each do |reservation|
      @reservations_dates << (reservation.start_date..reservation.end_date)
    end
    @transaction = Transaction.new
  end
end
