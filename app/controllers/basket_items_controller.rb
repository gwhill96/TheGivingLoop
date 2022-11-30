class BasketItemsController < ApplicationController
  def create
    basket = Basket.find(params[:basket_id])
    donation_type = DonationType.where(:id == params[:donation_type_id]).first
    item = BasketItem.create(donation_type_id: donation_type.id, basket_id: basket.id)
    # redirect_to basket_path(@basket)
  end


  def show

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
end
