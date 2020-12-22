class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden
  belongs_to :category
  belongs_to :province
  belongs_to :ship_day
  belongs_to :state
  validates :name, presence: true
  validates :description, presence: true

  has_one_attached :image
  validates :image, presence: true

  belongs_to :user

  with_options presence: true, format: { with:/\d/ } do
    validates :price
  end
  validates :price, :numericality => { :greater_than_or_equal_to => 300 }
  validates :price, :numericality => { :less_than_or_equal_to => 9999999 }

  with_options presence: true, numericality:{ other_than: 1 } do
    validates :burden_id
    validates :category_id
    validates :province_id
    validates :ship_day_id
    validates :state_id
  end
end
