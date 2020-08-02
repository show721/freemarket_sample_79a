class CardsController < ApplicationController


  def update
  end

  def new
    @card = Card.new
  end

  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    customer = Payjp::Customer.create(
      card: params[:card_token],
      metadata: {user_id: current_user.id}
    )
    binding.pry
    @card = Card.new(
      user_id: current_user.id,
      client_token: customer.id,
      card_token: customer.default_card
      
    )
    @card.save
  end
end
