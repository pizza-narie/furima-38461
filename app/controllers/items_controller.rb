class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :condition_id, :cost_id, :scheduled_day_id, :prefecture_id, :category_id). merge(user_id: current_user.id)
  end
end
