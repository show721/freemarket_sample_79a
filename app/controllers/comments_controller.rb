class CommentsController < ApplicationController
  def create
    product = Product.find(params[:id])
    if Comment.create(comment: params[:comment],user_id: current_user.id,product_id: product.id)
      redirect_to product_path(product.id)
    else
      render product_path(product.id)
    end
  end
end