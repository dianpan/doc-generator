FactoryGirl.define do
  factory :document do
    association :user, factory: :user
    loan_amount 10000
    down_payment 100
    interest_rate 10

    factory :invalid_document do
      association :user, factory: :user
      loan_amount nil
      down_payment nil
      interest_rate nil
    end
  end
end