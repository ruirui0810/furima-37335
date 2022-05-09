class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :item_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :addresses
    validates :phone_number, null: false, length: { in: 10..11 }
  end
  validates :building

end