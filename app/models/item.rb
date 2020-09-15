class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delfee
  belongs_to_active_hash :ship_ori
  belongs_to_active_hash :ship_day

  has_one :buy_manage
  has_one_attached :image

  validates :name, :description, :price, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delfee_id, numericality: { other_than: 1 }
  validates :ship_ori_id, numericality: { other_than: 1 }
  validates :ship_day_id, numericality: { other_than: 1 }
end
