class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @clothes = Clothe.all
  end
end
