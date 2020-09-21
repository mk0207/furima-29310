class OrdersManagesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @orders_manage = OrdersManageForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @orders_manage = OrdersManageForm.new(order_params)
    if @orders_manage.valid?
      pay_item
      @orders_manage.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:orders_manage_form).permit(:postal, :prefecture_id, :city, :ad_num, :build, :tell).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
  
end
