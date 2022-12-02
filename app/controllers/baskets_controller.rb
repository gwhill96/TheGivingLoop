class BasketsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_basket, only: %i[update show checkout]

  def create
    @basket = Basket.find(params[:basket_id])
    authorize @basket
    user = current_user if current_user
    @basket.user = user
    items = BasketItem.where(basket_id: @basket.id)
    line_items_data = {}
    line_items_array = []
    items.each do |item|
      line_items_array << line_items_data = {
        price_data: {
          currency: 'gbp',
          unit_amount: item.donation_type.price_cents,
          product_data: {
            name: item.donation_type.name
          },
        },
        quantity: 1
      }
    end
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_items_array,
      mode: "payment",
      success_url: basket_url(@basket),
      cancel_url: basket_url(@basket)
    )
    price_total = []
    line_items_array.each do |hash|
      price_total << hash[:price_data][:unit_amount]
    end
    @basket.update(checkout_session_id: session.id, amount_cents: price_total.sum, state: 'pending')
    redirect_to new_basket_payment_path(@basket)
  end

  def show
    authorize @basket
  end


  def update
    authorize @basket
    @basket.update(guest_user: guest_basket_params)
    flash[:notice] = "Your basket was successfully updated"
    redirect_to @basket
  end

  def checkout
    authorize @basket
    session[:basket_id] = nil
  end

  private

  def find_basket
    @basket = Basket.find(params[:id])
  end

  def guest_basket_params
    params.require(:guest_basket).permit(:email, :first_name, :last_name, :phone_number)
  end
end
