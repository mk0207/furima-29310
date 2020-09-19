class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }


  validates :postal, presence: true
  validates :city, presence: true
  validates :ad_num, presence: true
  validates :build, presence: true
  validates :tell, presence: true

  validates :token, presence: true

end
