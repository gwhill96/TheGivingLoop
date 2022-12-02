class StripeCheckoutSessionService
  def call(event)
    order = Basket.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')
  end
end
