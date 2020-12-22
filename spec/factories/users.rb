FactoryBot.define do
  factory :user do
    nickname { 'TestUser' }
    email { 'test_user@test.com' }
    password { '3edc4rfv' }
    password_confirmation { password }
  end
end