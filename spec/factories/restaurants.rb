FactoryBot.define do
  factory :restaurant do
    name 'test'
    email 'test@test.com'

    trait :no_phone do
      phone nil
    end

    trait :invalid_phone_number do
      phone '91 9738912733'
    end

    trait :valid_record do
      phone '+603 1234 5678'
    end
  end
end