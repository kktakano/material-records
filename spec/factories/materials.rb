FactoryBot.define do
  factory :material do
    name {Faker::Commerce.material}
    price {Faker::Commerce.price}
    value {Faker::Number.number(digits:9)}
    unit {Faker::Lorem.word}
    created_at {Faker::Time.between(from: DateTime.now - 2, to: DateTime.now)}
    # image {}
    # supplier {}
    user
  end
end