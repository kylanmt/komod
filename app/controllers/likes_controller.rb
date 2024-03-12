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
    respond_to do |format|
      if like.save
        format.html
        format.text # Follows the classic Rails flow and look for a create.json view
      else
        format.html
        format.text # Follows the classic Rails flow and look for a create.json view
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to profils_likes_path, status: :see_other, notice: 'Le like a été retiré avec succès.'
  end

  def unlike
    @like = Like.find_by(user: current_user, clothe_id: params[:clothe_id])
    # récupère le like grâce à current_user et clothe
    @like.destroy
    # params[:clothe_id]
    respond_to do |format|
        format.html
        format.text # Follows the classic Rails flow and look for a create.json view
    end
  end

  private

  def like_params
    params.require(:like).permit(:clothe_id)
  end
end
