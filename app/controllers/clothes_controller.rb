class ClothesController < ApplicationController
  def index
    @clothes = Clothe.global_search(params[:query])
    @categories = Category.all

    respond_to do |format|
      format.html
      format.text { render partial: 'clothes/list', locals: { clothes: @clothes, categories: @categories }, formats: [:html] }
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
