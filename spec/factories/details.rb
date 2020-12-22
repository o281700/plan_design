FactoryBot.define do
  factory :detail do
    title { 'Detail_Title' }
    text { 'ここでは詳細の内容を記述します。' }
    association :item
  end
end
