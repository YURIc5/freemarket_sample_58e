FactoryBot.define do
  factory :item do
    # text {"hello!"}
    # image {"hoge.png"}
    id { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end