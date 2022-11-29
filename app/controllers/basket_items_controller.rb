class BasketItemsController < ApplicationController
  def create
    @basket_item = BasketItem.new(basket_item_params)
    @basket_item.save
    redirect_to basket_path(@basket)
  end

  def new
    @basket_item = BasketItem.new
  end

  def destroy
    @basket_item.find(params[:id])
    @basket_item.destroy
    redirect_to basket_path, status: :see_other
  end

  private

  def basket_item_params
    params.require(:basket_item).permit(:basket_id, :donation_type_id)
  end
end

