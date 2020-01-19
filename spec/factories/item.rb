FactoryBot.define do
  factory :item do
    name {Faker::Commerce.material}
    price {Faker::Commerce.price}
    cost {Faker::Commerce.price}
    user
  end
end