class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @user = current_user
    @clothes = Clothe.all
    @other_clothes = Clothe.joins(:category)
                           .where.not(owner: current_user)
                           .where.not(category:
                                        { name:
                                          ["Robe de soirée",
                                           "Robe de mariée",
                                           "Accessoires femme"
                                           ] })
  end
end
