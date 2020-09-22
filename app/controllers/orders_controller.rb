class OrdersController < ApplicationController

  def index
    @order = OrdersManageForm.new
  end

  def create
    @order = OrdersManageForm.new(order_params)
    
  end

  private
  def order_params
    params.permit(:token, :postal, :prefecture_id, :city, :ad_num, :build, :tell).merge(user_id: current_user.id, :item_id)
  end

end
