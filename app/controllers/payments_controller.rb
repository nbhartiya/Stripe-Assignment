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

  def receive_webhook
    # Use webhooks to receive information about asynchronous payment events.
    # For more about our webhook events check out https://stripe.com/docs/webhooks.
    webhook_secret = ENV['STRIPE_WEBHOOK_SECRET']
    payload = request.body.read
    if !webhook_secret.empty?
      # Retrieve the event by verifying the signature using the raw body and secret if webhook signing is configured.
      sig_header = request.env['HTTP_STRIPE_SIGNATURE']
      event = nil

      begin
        event = Stripe::Webhook.construct_event(
          payload, sig_header, webhook_secret
        )
      rescue JSON::ParserError => e
        # Invalid payload
        status 400
        return
      rescue Stripe::SignatureVerificationError => e
        # Invalid signature
        puts '⚠️  Webhook signature verification failed.'
        status 400
        return
      end
    else
      data = JSON.parse(payload, symbolize_names: true)
      event = Stripe::Event.construct_from(data)
    end
    # Get the type of webhook event sent - used to check the status of PaymentIntents.
    event_type = event['type']
    data = event['data']
    data_object = data['object']

    if event_type == 'payment_intent.succeeded'
      puts '💰 Payment received!'
      # Fulfill any orders, e-mail receipts, etc
      # To cancel the payment you will need to issue a Refund (https://stripe.com/docs/api/refunds)
    elsif event_type == 'payment_intent.payment_failed'
      puts '❌ Payment failed.'
    end

    render json: {status: 'success'}.to_json

  end
end
