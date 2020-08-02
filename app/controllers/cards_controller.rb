class CardsController < ApplicationController

  def index
  end

  def update
  end

  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    customer = Payjp::Customer.create(
      card: params[:card_token],
      metadata: {user_id: current_user.id}
    )
    
    @card = Card.new(
      user_id: current_user.id
      card_token: customer.default_card,
      client_token: customer.id,
      
    )
    @card.save
  end
end
