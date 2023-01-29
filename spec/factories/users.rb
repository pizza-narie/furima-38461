FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.first_name }
    email                 { Faker::Internet.email }
    password              {'1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    family_name           {'竈門'}
    first_name            {'炭治郎'}
    family_name_kana      {'カマド'}
    first_name_kana       {'タンジロウ'}
    birth_day             {'2010-7-14'}
  end
end