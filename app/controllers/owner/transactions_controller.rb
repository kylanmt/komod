class Owner::TransactionsController < ApplicationController
  def index
    user = current_user
    @emprunts = user.transactions
    @clothes = user.clothes
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def manage
  end
end
