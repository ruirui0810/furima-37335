class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order

  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_shipping_free_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery

  has_one_attached :image

  validates :item_name, presence: true
  validates :item_info, presence: true

  validates :item_category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_sales_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_shipping_free_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_scheduled_delivery_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}

  validates :item_price, presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  validates :image, presence: true


end
