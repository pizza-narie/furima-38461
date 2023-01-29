FactoryBot.define do
  factory :order_form do
    post_code              {'247-0032'}
    city                   {'横浜市栄区'}
    address1               {'桂台東'}
    address2               {'メゾン東'}
    telephone              {'08090879824'}
    prefecture_id          {2}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
