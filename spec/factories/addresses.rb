FactoryBot.define do
  
  factory :address do
    postcode         {"182-0034"}
    city             {"調布市"}
    block            {"下石原1-55"}
    building         {"フレームaa11"}
    prefecture_id    {22}
    user_id          {44}
  end
  
end