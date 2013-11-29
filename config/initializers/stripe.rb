Rails.configuration.stripe = {
  :publishable_key => "pk_test_yCmk3Bv6KPUtMwncIZKcS8Qk",
  :secret_key      => "sk_test_Owyh9RyT0GRAch2RAwq5qGcy"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]