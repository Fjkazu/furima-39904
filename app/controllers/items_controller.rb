class ItemsController < ApplicationController

  before_action :move_to_index, only: [:new]

  def index
  end

  def new

  end



  private

  def item_params
    params.require(:item).permit(:image, :item_name, :overview, :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :how_many_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
