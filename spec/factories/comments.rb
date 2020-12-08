FactoryBot.define do
  factory :comment do
    text { "kkkkkkk" }
    association :user
    association :expense
  end
end
