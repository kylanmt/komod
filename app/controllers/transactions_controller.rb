class TransactionsController < ApplicationController

  def create
    clothe = Clothe.find(params[:clothe_id])
    transaction = Transaction.new
    transaction.clothe = clothe
    transaction.client = current_user
    transaction.price = clothe.value
    transaction.status = "new"
    if transaction.save
      redirect_to owner_transaction_path(transaction)
    else
      redirect_to clothe_path(clothe)
    end
  end

  def edit
  end

  def update
  end
end
