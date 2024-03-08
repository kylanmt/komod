class Owner::ClothesController < ApplicationController
  def new
    @clothe = Clothe.new
  end

  def create
    clothe = Clothe.new(clothe_params)
    clothe.owner = current_user
    clothe.available = true
    if clothe.save!
      redirect_to clothe_path(clothe)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @clothe = Clothe.new
  end

  def edit
  end

  def destroy
  end

  private

  def clothe_params
    params.require(:clothe).permit(:name, :description, :size, :category, :value, :condition, :brand, photos: [])
  end
end
