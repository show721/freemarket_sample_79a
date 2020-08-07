class CommentsController < ApplicationController
  def create
    product_id = Product.find_by(params[:id])
    if Comment.create(comment: comment_params[:comment],user_id: current_user.id,product_id: product_id.id)
      redirect_to product_path(product_id.id)
    else
      render :show
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end