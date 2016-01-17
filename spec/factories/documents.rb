FactoryGirl.define do
  factory :document do
    association :user, factory: :user
    loan_amount 10000
    down_payment 100
    interest_rate 10
  end

  factory :invalid_document do
    association :user, factory: :user
    loan_amount nil
  end

  factory :negative_amount_document do
    association :user, factory: :user
    loan_amount -1
    down_payment -1
    interest_rate -1
  end

end