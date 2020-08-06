class FavsController < ApplicationController
  def create
    fav = current_user.favs.build(product_id: params[:product_id])
    fav.save!
    redirect_to products_path, success: t('.flash.fav')
  end

  def destroy
    current_user.favs.find_by(product_id: params[:product_id]).destroy!
    redirect_to products_path, success: t('.flash.not_fav')
  end
end
