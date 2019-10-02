FactoryBot.define do

  factory :user do
    nickname              {"kami"}
    name                  {"上島拓巳"}
    name_kana             {"カミシマタクミ"}
    email                 {"tk1128kami@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    birthday              {"19961128"}
    phone_number          {"08063540880"}
  end

end