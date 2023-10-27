class BuysController < ApplicationController
before_action :set_item, only: [:index, :create]


  def index
    @item = Item.find(params[:item_id])
    @buy_shipping = BuyShipping.new
  end


  def create
    @buy_shipping = BuyShipping.new(shipping_params)
    if @buy_shipping.valid?
      Payjp.api_key = "sk_test_f7284f8789849796e3691fae"
      Payjp::Charge.create(
        amount: @item.price,
        card: shipping_params[:token],
        currency: 'jpy'
      )
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
    params.require(:buy_shipping).permit(:post_code, :prefecture_id, :municipality, :address, :building, :tel_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


end
