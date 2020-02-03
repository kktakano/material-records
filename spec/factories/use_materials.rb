FactoryBot.define do
  factory :use_material do
    price {Faker::Commerce.price}
    item
    material
  end
end