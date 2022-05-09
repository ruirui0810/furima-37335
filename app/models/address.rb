class Address < ApplicationRecord
  belongs_to :order

  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :item_prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city, presence: true
  validates :addresses, presence: true
  validates :building
  validates :phone_number, null: false, length: { in: 10..11 }

end
