FactoryBot.define do
  factory :buy_shipping do
    token {"tok_abcdefghijk00000000000000000"}
    post_code {"123-4567"}
    prefecture_id {2}
    municipality {"春日部市"}
    address {"1-1"}
    building {"野原家"}
    tel_number {12345678901}
  end
end
