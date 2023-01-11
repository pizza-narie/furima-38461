FactoryBot.define do
  factory :user do
    nickname              {'tanjirou'}
    email                 {'tanjirou@example'}
    password              {'1234kamado'}
    password_confirmation {password}
    family_name           {'竈門'}
    first_name            {'炭治郎'}
    family_name_kana      {'カマド'}
    first_name_kana       {'タンジロウ'}
    birth_day             {'2010-7-14'}
  end
end