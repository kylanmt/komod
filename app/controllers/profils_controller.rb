class ProfilsController < ApplicationController
  def show
    @user = current_user
    transactions = Transaction.where(status: ["new", "pending"], client_id: @user.id)
    @transactions = transactions.sort_by { |transaction| [transaction.start_date] }
    @clothes = @user.clothes
    @clothes_new = @clothes.joins(:transactions).where(transactions: { status: "new" })
    @clothes_in_progress = @clothes.joins(:transactions).where(transactions: { status: "pending" })
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
