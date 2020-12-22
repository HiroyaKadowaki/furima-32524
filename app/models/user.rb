class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth, presence: true

  has_many :irems
  has_many :orders


  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  with_options format: { with: PASSWORD_REGEX } do
    validates :password
  end

with_options presence: true, format: { with:/\A[ァ-ヶー－]+\z/, message: '全角カナを使用してください' } do
  validates :last_kana
  validates :first_kana
end
with_options presence: true, format: { with:/\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください'} do
  validates :last_name
  validates :first_name
end
end
