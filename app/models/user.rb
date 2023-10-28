class User < ApplicationRecord
  has_many :items
  has_many :buys

  validates :nickname, :last_name, :first_name, :kanalast_name, :kanafirst_name, :birthdate, presence: true
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :kanalast_name, :kanafirst_name, format: { with: /\A[ァ-ヶー－]+\z/ }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
