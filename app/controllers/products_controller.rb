class ProductsController < ApplicationController
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    binding.pry
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      redirect_to products_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :description , :category , :brand ,:price ,:condition , :shipping_charge ,:shipping_area ,:shipping_day ,images_attributes: [:image])
  end
end
