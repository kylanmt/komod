class ClothesController < ApplicationController
  def index
    @clothes = Clothe.where("name @@ :query OR description @@ :query OR brand @@ :query", query: "%#{params[:query]}%")
    @categories = Category.all

    respond_to do |format|
      format.html
      format.text { render partial: 'list.html', locals: { clothes: @clothes } }
    end
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
