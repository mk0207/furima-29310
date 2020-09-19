class Order < ApplicationRecord

  validates :postal, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :ad_num, presence: true
  validates :build, presence: true
  validates :tell, presence: true

end
