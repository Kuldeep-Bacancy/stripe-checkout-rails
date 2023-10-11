class PagesController < ApplicationController

  def index; end

  def pre_built_checkout; end

  def custom_checkout; end

  def create_session
    session = Stripe::Checkout::Session.create({
        customer_email: 'customer@example.com',
        payment_intent_data: {setup_future_usage: 'off_session'},
        line_items: [{
          price_data: {
            currency: 'inr',
            product_data: {name: 'T-shirt'},
            unit_amount: 500000,
          },
          quantity: 1,
        },
        {
          price_data: {
            currency: 'inr',
            product_data: {name: 'Jeans'},
            unit_amount: 500000,
          },
          quantity: 2,
        }],
        mode: 'payment',
        success_url: 'http://localhost:3000/success',
        cancel_url: 'http://localhost:3000/cancel',
      })
    redirect_to session.url, allow_other_host: true
  end

  def create_payment_intent
    payment_intent = Stripe::PaymentIntent.create(
      amount: 10000,
      currency: 'inr',
      automatic_payment_methods: {
        enabled: true,
      },
    )
    render json: { clientSecret: payment_intent.client_secret }
  end
end
