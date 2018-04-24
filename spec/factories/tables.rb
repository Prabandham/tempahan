FactoryBot.define do
  factory :table do
    name 'Normal'

    trait :valid_record do
      minimum_capacity 2
      maximum_capacity 4
    end

    trait :invalid_record do
      minimum_capacity 4
      maximum_capacity 2
    end
  end
end