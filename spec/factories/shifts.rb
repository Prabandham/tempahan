FactoryBot.define do
  factory :shift do
    name 'Morning Shift'

    trait :invalid_start_and_end_times do
      start_time DateTime.parse('2018-01-01 09:00 AM')
      end_time DateTime.parse('2018-01-01 08:00 AM')
    end

    trait :valid_start_and_end_times do
      start_time DateTime.parse('2018-01-01 09:00 AM')
      end_time DateTime.parse('2018-01-01 01:00 PM')
    end
  end
end