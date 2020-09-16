class ItemsController < ApplicationController
  def index
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
    params.require(:item).permit(:name,:image,:description,:price,:category_id,:status_id,:delfee_id,:ship_ori_id,:ship_day_id)
  end

  def item_params_image
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

end
