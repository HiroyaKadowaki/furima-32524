class OrderShip
  include ActiveModel::Model
  attr_accessor :zip, :city, :address, :phone_number, :province_id, :price, :token, :buiding, :item_id, :user_id

  with_options presence: true do
    validates :zip, format:  { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]+\z/, messages: "can't be blank" }
    validates :province_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Ship.create(zip: zip, city: city, address: address, phone_number: phone_number,province_id: province_id, order_id: order.id, buiding: buiding)
  end
end
