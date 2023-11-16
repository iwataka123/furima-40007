FactoryBot.define do
  factory :buying_history_payment do
    post_code         {'111-2222'}
    prefecture_id     {'24'}
    municipality      {'まさ市'}
    address           {'ざ区'}
    phone_number      {'00000000000'}
    token             {'tok_abcdefghijk00000000000000000'}
    buying_history {'1'}
    user_id {'1'}
    item_id {'1'}

  end
end
