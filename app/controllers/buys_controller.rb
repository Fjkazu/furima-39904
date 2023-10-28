class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    if current_user.id != @item.user_id && @item.buy == nil
      @buy_shipping = BuyShipping.new
    else
      redirect_to root_path
    end
  end

  def create
    @buy_shipping = BuyShipping.new(shipping_params)
    if @buy_shipping.valid?
      payjp
      @buy_shipping.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def shipping_params
    params.require(:buy_shipping).permit(:post_code, :prefecture_id, :municipality, :address, :building, :tel_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def payjp
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: shipping_params[:token],
      currency: 'jpy'
    )
  end

end
