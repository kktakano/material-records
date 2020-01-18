FactoryBot.define do
  factory :user do
    # name                  {"abe"}
    # email                 {"kkk@gmail.com"}
    # password              {"00000000"}
    # password_confirmation {"00000000"}
    password = Faker::Internet.password(min_length: 6, max_length: 20)
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {password}
    password_confirmation {password}
  end
end