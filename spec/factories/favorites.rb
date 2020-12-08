FactoryBot.define do
  factory :favorite do
    checked { 1 }
    association :user
    association :expense
  end
end
