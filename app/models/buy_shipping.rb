class BuyShipping

  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building, :tel_number

  validates :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :tel_number, presence: true
  validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :tel_number, format: { with: /\A\d{10,11}\z/ }
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Shipping.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, tel_number: tel_number, buy_id: buy.id)
  end

end