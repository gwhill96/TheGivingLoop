class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    if current_user
      authorize @order
      @order = current_user.baskets.where(state: 'pending').find(params[:basket_id])
    else
      skip_authorization
      @order = Basket.find(params[:basket_id])
    end
  end

  def show
    if current_user
      authorize @order
      @order = current_user.baskets.where(state: 'paid').find(params[:basket_id])
    else
      skip_authorization
      @order = Basket.where(state: 'paid').find(params[:basket_id])
    end
  end
end
