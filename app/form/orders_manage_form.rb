class OrdersManageForm

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal, :prefecture_id, :city, :ad_num, :build, :tell


  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  validates :postal, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ , message: "code Input correctly"}
  validates :city, presence: true
  validates :ad_num, presence: true
  #validates :tell, presence: true, format: { with: /\A\d{11}\z/ }

  validates :token, presence: true

  def save
    orders_manage = OrdersManage.create(user_id: user_id, item_id: item_id,)
    Order.create(postal: postal, prefecture_id: prefecture_id, city: city, ad_num: ad_num, build: build, tell: tell, orders_manage_id: orders_manage.id)
  end

end