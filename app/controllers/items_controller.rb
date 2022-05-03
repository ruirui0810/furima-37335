class ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_price, :item_category_id, :item_sales_status_id, :item_shipping_free_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end

end