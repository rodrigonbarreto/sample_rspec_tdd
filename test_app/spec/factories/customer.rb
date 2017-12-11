FactoryBot.define do
    factory :customer, aliases: [:user] do
      name Faker::Name.name
      sequence(:email) { |n| Faker::Internet.email }
      vip true
      days_to_pay true

      factory :vip do
        vip true
        days_to_pay 30
      end
  
      factory :default do
        vip false
        days_to_pay 15
      end
  
      after(:create) do |customer, evaluator|
        customer.name if evaluator
      end
    end
  end