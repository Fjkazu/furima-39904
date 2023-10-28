class BuyShipping
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building, :tel_number

  validates :token, :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :tel_number, presence: true
  validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :tel_number, format: { with: /\A\d{10,11}\z/ }
  validates :prefecture_id, numericality: { other_than: 1, message: "都道府県を選択してください" }
  def save
    buy = Buy.create(item_id:, user_id:)
    Shipping.create(post_code:, prefecture_id:, municipality:, address:,
                    building:, tel_number:, buy_id: buy.id)
  end
end
