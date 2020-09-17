class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delfee
  belongs_to_active_hash :ship_ori
  belongs_to_active_hash :ship_day

  has_one :buy_manage
  has_one_attached :image

  validates :image, :name, :description, :price, presence: true

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :delfee_id
    validates :ship_ori_id
    validates :ship_day_id
  end

  validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
