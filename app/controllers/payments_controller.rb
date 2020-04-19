class PaymentsController < ApplicationController
  protect_from_forgery with: :null_session

  def new
  end

  def create
    data = JSON.parse(request.body.read)

    # Create a PaymentIntent with the order amount and currency
    payment_intent = Stripe::PaymentIntent.create(
      amount: data['amount'],
      currency: data['currency']
    )

    # Send publishable key and PaymentIntent details to client
    response = {
      publishableKey: ENV['STRIPE_PUBLISHABLE_KEY'],
      clientSecret: payment_intent['client_secret'],
      id: payment_intent['id']
    }.to_json

    render json: response
  end
end
