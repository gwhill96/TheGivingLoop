class PaymentsController < ApplicationController
  def new
    @order = current_user.baskets.where(state: 'pending').find(params[:basket_id])
  end
end