FactoryBot.define do
  factory :favorite_count do
    count { 1 }
    association :expense
  end
end
