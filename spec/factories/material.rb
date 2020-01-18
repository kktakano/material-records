FactoryBot.define do
  factory :material do
    name {Faker::Commerce.material}
    price {Faker::Commerce.price}
    value {Faker::Number.number(digits:9)}
    unit {Faker::Lorem.word}
    # image {}
    # supplier {}
    user
  end
end