FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password Faker::Internet.password(8)
  end

  factory :new_user, class: User do
    email {Faker::Internet.email}
    password {Faker::Internet.password(8)}
  end
end