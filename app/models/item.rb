class Item < ApplicationRecord
  belongs_to :user
  # has_one :buy
  has_one_attached :image

  validates :item_name, :overview, :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :how_many_day_id, :price, presence: true
end
