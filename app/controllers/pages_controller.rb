class PagesController < ApplicationController

  def index; end

  def pre_built_checkout; end

  def custom_checkout; end

  def create_session
    session = Stripe::Checkout::Session.create({
        line_items: [{
          # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
          price: 'price_1NzbpKSJBtqJoKyOQ9j4hfRu',
          quantity: 1,
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
