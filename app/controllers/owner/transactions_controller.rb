class Owner::TransactionsController < ApplicationController
  def index
    user = current_user
    @locations = Transaction.where(status: ["new", "pending"], client_id: user.id)
    @shares = Transaction.where(status: ["new", "pending"])
    @location_finished = Transaction.where(status: "finished", client_id: user.id)
    @share_finished = Transaction.where(status: "finished")
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def manage
  end
end
