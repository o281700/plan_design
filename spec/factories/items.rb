FactoryBot.define do
  factory :item do
    title { 'Item_Title' }
    association :plan
  end
end
