class ProductsController < ApplicationController
  before_action :set_category, only: [:new, :edit, :show, :create]
  before_action :correct_user, only: [:edit, :update]

  def index
    @products = Product.includes(:images).order('created_at DESC')
    @images = Image.all.order("created_at DESC").limit(8)
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
      redirect_to root_path
    else
      render :new
    end 
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def destroy
  end
  
  def buy
  end

  def get_category_children
   @category_children = Category.find_by(category: "#{params[:product_category]}", ancestry: nil).children
  end

  def get_category_grandchildren
   @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def product_params
    params.require(:product).permit(:name, 
                                    :description, 
                                    :category_id,
                                    :brand,
                                    :price,
                                    :condition, 
                                    :shipping_charge,
                                    :shipping_area,
                                    :shipping_day,
                                    images_attributes: [:image, :_destroy, :id])
  end

  def set_category
    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.category
    end
  end

  def correct_user
    product = Product.find_by(id: params[:id])
    unless current_user.id == product.seller_id
      redirect_to root_path
    end
  end


end

