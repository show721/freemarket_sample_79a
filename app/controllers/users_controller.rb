class UsersController < ApplicationController
  def index
    @user = User.find_by(id: current_user.id)
    @buyer = Product.where(buyer_id: current_user.id).order("created_at DESC").limit(5)
  end

  def new
  end

  def edit
  end
end
