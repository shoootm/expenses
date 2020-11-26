FactoryBot.define do
  factory :user do
    nickname {'mffmfm'}
    email    {'test123@sample.com'}
    password {'123qaz'}
    password_confirmation {password}
    prefecture {'青森県'}
    municipalitie{'摂津市'}
  end
end
