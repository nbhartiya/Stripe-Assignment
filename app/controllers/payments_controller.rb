class PaymentsController < ApplicationController
  def new
    @intent = Stripe::PaymentIntent.create(
      amount: 1200,
      currency: 'usd',
      metadata: {integration_check: 'accept_a_payment', stripe_hw_app: 'yes'}
    )
  end
end
