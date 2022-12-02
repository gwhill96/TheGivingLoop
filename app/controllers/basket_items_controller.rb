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
    authorize @basket_item
    @basket = Basket.find(params[:basket_id])
    @basket.user = current_user if current_user
    @basket_item.basket = @basket
    if @basket_item.save
      BasketChannel.broadcast_to(
        @basket,
        render_to_string(partial: "basket", locals: { basket: @basket })
      )
      head :ok
    else
      render "root", status: :unprocessable_entity
    end
  end

  def destroy
    @basket_item = BasketItem.find(params[:basket_id])
    authorize @basket_item
    @basket_item.destroy
    redirect_to basket_path, status: :see_other
  end

  private

  def basket_item_params
    params.require(:basket_item).permit(:basket_id, :donation_type_id)
  end

  def guest_token
    session[:basket_id] ||= SecureRandom.uuid
  end
end
