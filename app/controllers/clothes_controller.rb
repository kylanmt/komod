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
    markers_maker(@clothe)
    @transaction = Transaction.new
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
