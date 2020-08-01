class ProductsController < ApplicationController
  before_action :set_products, only: [:show, :destroy]
  
  def index
    @products = Product.includes(:images).order('created_at DESC')
    @images = Image.all.order("created_at DESC").limit(4)
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.new(product_params)
    @product[:seller_id] = current_user.id
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update_attributes(product_params)
      render :edit
    else
      render :edit
    end 
  end

  def show
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  
  def buy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

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
                                    images_attributes: [:image, :_destroy, :id])
  end

end
