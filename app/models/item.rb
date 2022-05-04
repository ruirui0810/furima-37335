class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_shipping_free_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery
  has_one_attached :image
  belongs_to :user


  validates :item_name, presence: true
  validates :item_info, presence: true

  validates :item_category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_sales_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_shipping_free_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_scheduled_delivery_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}

  validates :item_price, presence: true
  validates :user, presence: true

  validates :image, presence: true


end
