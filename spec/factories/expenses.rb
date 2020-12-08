FactoryBot.define do
  factory :expense do
    income { 111 }
    food_expense { 111 }
    necessities { 111 }
    clothes_expense { 111 }
    beauty_expense { 111 }
    entertainment_expense { 111 }
    medical_bill { 111 }
    education_cost { 111 }
    utility_costs { 111 }
    traveling_expense { 111 }
    other { 111 }
    memo { 'ffffタタた' }
    association :user
  end
end
