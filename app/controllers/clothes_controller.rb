class ClothesController < ApplicationController
  def index
    @clothes = Clothe.where(owner: current_user)
  end

  def show
    raise
    @clothe = Clothe.find(params[:id])
  end
end
