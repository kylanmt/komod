class ProfilsController < ApplicationController
  def show
    @user = current_user
    @transactions = @user.transactions
    @clothes = @user.clothes
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(profil_params)
    redirect_to profils_path(@user)
  end

  private

  def profil_params
    params.require(:profil).permit(:email, :user_name, :first_name, :last_name, :phone_number, :address)
  end
end
