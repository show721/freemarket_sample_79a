class ToppagesController < ApplicationController
  def index
    @products = Product.all.order("created_at DESC").limit(4)
  end

  def show
    @product = Product.find(params[:id])
  end

  def post_params
    params.require(:images).permit(:image)
    params.require(:products).permit(:product_name, :price)
  end
end