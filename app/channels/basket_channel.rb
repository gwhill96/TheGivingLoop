class BasketChannel < ApplicationCable::Channel
  def subscribed
    basket = Basket.find(params[:id])
    stream_for basket
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
