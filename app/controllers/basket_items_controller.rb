class BasketItemsController < ApplicationController
  skip_before_action :authenticate_user!
  # before_action :find_basket, only: %i[update checkout]
  # def create
  #   basket = Basket.find(params[:basket_id])
  #   donation_type = DonationType.where(:id == params[:donation_type_id]).first
  #   item = BasketItem.create(donation_type_id: donation_type.id, basket_id: basket.id)
  #   # redirect_to basket_path(@basket)

  def create
    @basket_item = BasketItem.new(basket_item_params)
    basket_id = session[:basket_id]
    if basket_id
      @basket = Basket.find(basket_id)
    else
      # Think this code is not getting used as there should always be a basket_id by this point.
      @basket = Basket.new
      @basket.user = current_user if current_user
      basket_id = session[:basket_id]
      @basket.id = basket_id
      @basket.save
    end
    @basket_item.basket = @basket
    @basket_item.save
  end

  # def new
  #   @basket_item = BasketItem.new
  # end

  # def destroy
  #   @basket_item.find(params[:id])
  #   @basket_item.destroy
  #   redirect_to basket_path, status: :see_other
  # end

  private

  def basket_item_params
    params.require(:basket_item).permit(:basket_id, :donation_type_id)
  end

  def guest_token
    session[:basket_id] ||= SecureRandom.uuid
  end
end
