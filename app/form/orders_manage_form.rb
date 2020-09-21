class OrdersManageForm

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal, :prefecture_id, :city, :ad_num, :build, :tell


  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  validates :postal, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ , message: "code Input correctly"}
  validates :city, presence: true
  validates :ad_num, presence: true
  validates :tell, presence: true, format: { with: /\A\d{9,10,11}\z/ }

  validates :token, presence: true

  def save
    OrdersManage.create(use_id: user.id, item_id: item.id,)
    Order.create(postal: postal.id, prefecture_id: prefecture.id, city: city.id, ad_num: ad_num.id, build: build.id, tell: tell.id)
  end

end