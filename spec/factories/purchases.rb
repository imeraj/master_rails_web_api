FactoryBot.define do
  factory :purchase do
    book
    user
    idempotency_key { "12345" }
  end
end
