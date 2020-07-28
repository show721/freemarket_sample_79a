class ToppagesController < ApplicationController
  def index
    @products = Product.all.order("created_at DESC").limit(3)
  end

  def show
    @products = Product.find(params[:id])
  end

  def post_params
    params.require(:images).permit(:imgge)
    params.require(:products).permit(:product_name, :price)
  end
end