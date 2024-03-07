class LikesController < ApplicationController
  def index
  end

  def create
    clothe = Clothe.find(params[:clothe_id])
    user = current_user
    like = Like.new
    like.clothe = clothe
    like.user = user
    like.save!
    end
  end

  def destroy
  end

  private

  def like_params
    params.require(:like).permit(:clothe_id)
  end
end
