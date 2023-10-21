class ItemsController < ApplicationController
  def index
  end
  



  private

  def item_params
    params.require(:item).permit(:image, :item_name, :overview, :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :how_many_day_id, :price).merge(user_id: current_user.id)
  end

end
