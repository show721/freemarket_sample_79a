class CommentsController < ApplicationController
  def create
    if @comment = Comment.create(comment_params)
      respond_to do |format|
        format.html{ redirect_to product_path(@comment.product.id) }
      end
    else
      redirect_to product_path(@comment.product.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
end
