require 'stripe'

Stripe.api_key = ENV['STRIPE_API_KEY']
Stripe.log_level = Stripe::LEVEL_ERROR