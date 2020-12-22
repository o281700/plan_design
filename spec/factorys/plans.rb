FactoryBot.define do
  factory :plan do
    title { 'Test_Plan' }
    association :user
  end
end
