class ClothesController < ApplicationController
  def index
    @clothes = Clothe.where(owner: current_user)
  end

  def show
    @clothe = Clothe.find(params[:id])
  end
end
