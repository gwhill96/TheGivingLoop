class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    if current_user
      @order = current_user.baskets.where(state: 'pending').find(params[:basket_id])
      authorize @order
    else
      skip_authorization
      @order = Basket.find(params[:basket_id])
    end
  end

  def show
    if current_user
      @order = current_user.baskets.where(state: 'paid').find(params[:basket_id])
      authorize @order
    else
      skip_authorization
      @order = Basket.where(state: 'paid').find(params[:basket_id])
    end
    checkout
  end

  private

  def checkout
    session[:basket_id] = nil
  end
end
