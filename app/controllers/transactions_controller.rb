class TransactionsController < ApplicationController
  
  def create
    clothe = Clothe.find(params[:clothe_id])
    transaction = Transaction.new(transaction_params)
    create_transaction(transaction, clothe)
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

  private

  def create_transaction(transaction, clothe)
    transaction.clothe = clothe
    transaction.client = current_user
    transaction.price = clothe.value
    transaction.status = "new"
  end

  def transaction_params
    params.require(:transaction).permit(:start_date, :end_date)
  end
end
