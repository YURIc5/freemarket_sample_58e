FactoryBot.define do
  factory :item do
    # id { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    # user

    name                     {"アイテム名"}
    description              {"お気に入り"}
    size                     {3}
    brand                    {"テストブランド"}
    status                   {1}
    day                      {1}
    price                    {300}
    category_id              {1}
    prefecture_id            {1}
    user_id                  {1}
    delivery_id              {1}
  end
end