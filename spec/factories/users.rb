FactoryGirl.define do
  factory :user, class: User do
    email { Faker::Internet.email }
    password '12345678'
    password_confirmation '12345678'
  end

  factory :invalid_user do
    email nil
  end

end