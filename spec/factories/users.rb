FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password '123456'
    factory(:admin) do
      admin true
    end
  end
end
