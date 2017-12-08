FactoryBot.define do
    factory :customer, aliases: [:user] do

      name "Rodrigo Barreto"
      #email { Faker::Internet.email }
      sequence(:email) { |n| "meu_email-#{n}@email.com" }
  
      after(:create) do |customer, evaluator|
        customer.name if evaluator
      end
    end
  end