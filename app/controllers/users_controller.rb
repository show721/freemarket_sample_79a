class UsersController < ApplicationController
  def index
    @user = User.find_by(id: current_user.id)
  end

  def new
  end

  def edit
  end
end
