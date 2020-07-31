class ProductsController < ApplicationController
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.build

    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.category
    end
  end

   def get_category_children
    @category_children = Category.find_by(category: "#{params[:product_category]}", ancestry: nil).children
   end

   def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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
  end

  def update
  end

  def destroy
  end
  
  def buy
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
  
end