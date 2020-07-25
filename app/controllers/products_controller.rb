class ProductsController < ApplicationController
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
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
    params.require(:product).permit(:name, 
                                    :description, 
                                    :category, 
                                    :brand,
                                    :price,
                                    :condition, 
                                    :shipping_charge,
                                    :shipping_area,
                                    :shipping_day,
                                    images_attributes: [:image])
  end

  def show
  end
end
