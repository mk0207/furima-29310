FactoryBot.define do
  factory :item do

    # image {}
    name {'商品名'}
    description {'説明文'}
    category_id {2}
    status_id {2}
    delfee_id {2}
    ship_ori_id {2}
    ship_day_id {2}
    price {800}
  end
end
