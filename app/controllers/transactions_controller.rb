class TransactionsController < ApplicationController
  def create
    clothe = Clothe.find(params[:clothe_id])
    transaction = Transaction.new
    setup_date(transaction, transaction_params[:start_date])
    setup_transaction(transaction, clothe)


    chatroom = Chatroom.create(name: "#{clothe.name} - #{clothe.owner.user_name}")
    transaction.chatroom = chatroom

    if transaction.save
      redirect_to owner_transaction_path(transaction)
    else
      redirect_to clothe_path(clothe), status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    transaction = Transaction.find(params[:id])
    transaction.destroy
    redirect_to profils_path(current_user)
  end

  private

  def setup_date(transaction, date_range)
    dates = date_range.split(" to ")
    transaction.start_date = dates[0]
    if dates.size == 1
      transaction.end_date = transaction.start_date + 1
    else
      transaction.end_date = dates[1]
    end
  end

  def setup_transaction(transaction, clothe)
    transaction.clothe = clothe
    transaction.client = current_user
    transaction.price = clothe.value
    transaction.status = "new"
  end

  def transaction_params
    params.require(:transaction).permit(:start_date)
  end
end
