class FavsController < ApplicationController

  def create
    product_id = Product.find(params[:id])
    Fav.create(user_id:current_user.id, product_id:product_id.id)
    redirect_to product_path(product_id.id)
  end
end
