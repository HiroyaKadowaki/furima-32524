class Ship < ApplicationRecord
  validates :zip, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :province_id, presence: true

  belongs_to :order
end
