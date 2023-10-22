class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :condition
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :delivery_cost
  validates :delivery_cost_id, numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :prefecture
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :how_many_day
  validates :how_many_day_id, numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :user
  # has_one :buy
  has_one_attached :image

  validates :image, :item_name, :overview, :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :how_many_day_id,
            :price, presence: true
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'は ¥300~9,999,999 の間で半角数字で指定してください' }
  validates :price, numericality: { only_integer: true, message: 'Half-width number' }
end
