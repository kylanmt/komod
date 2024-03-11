class LikesController < ApplicationController
  def index
    @likes = current_user.likes
  end

  def create
    clothe = Clothe.find(params[:clothe_id])
    user = current_user
    like = Like.new
    like.clothe = clothe
    like.user = user
    like.save!
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to profils_likes_path, status: :see_other, notice: 'Le like a été retiré avec succès.'
  end

  private

  def like_params
    params.require(:like).permit(:clothe_id)
  end
end
