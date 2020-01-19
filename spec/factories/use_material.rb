Factory.Bot.define do
  factory :use_material do
    price {Faker::Commerce.price}
    user
    material
  end
end