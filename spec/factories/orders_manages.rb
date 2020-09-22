FactoryBot.define do
  factory :orders_manage_form do
    postal { '123-1234' }
    prefecture_id { 2 }
    city { '豊島区' }
    ad_num { 'あいう1-2' }
    building { 'アイウエオ' }
    tell { '09012341234' }
    token { '1a1a' }
  end
end
