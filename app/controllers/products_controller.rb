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

  def show
    @product = Product.find(params[:id])
  end

  def update
  end

  def destroy
    @products = Product.find(params[:id])
    @products.destroy
    redirect_to root_path
  end
  
  def buy
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
                                    :text,
                                    images_attributes: [:image, :_destroy, :id])
  end

end
