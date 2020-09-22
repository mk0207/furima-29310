class OrdersManagesController < ApplicationController
  before_action :set_orders_manage, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :redirect, only: [:index]
  before_action :ordered, only: [:index]

  def index
    @orders_manage = OrdersManageForm.new
  end

  def create
    @orders_manage = OrdersManageForm.new(order_params)
    if @orders_manage.valid?
      pay_item
      @orders_manage.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:orders_manage_form).permit(:postal, :prefecture_id, :city, :ad_num, :building, :tell).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def redirect
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end

  def ordered
    @item = Item.find(params[:item_id])
    redirect_to root_path unless @item.orders_manage.nil?
  end

  def set_orders_manage
    @item = Item.find(params[:item_id])
  end

end
