FactoryBot.define do
  factory :item do
    id { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end