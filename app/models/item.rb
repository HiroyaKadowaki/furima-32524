class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :burden_id, presence: true
  validates :category_id, presence: true
  validates :province_id, presence: true
  validates :ship_day_id, presence: true
  validates :state_id, presence: true

  belongs_to :user
end
