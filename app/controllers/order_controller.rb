class OrderController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
  end
  
  def create

    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new(order_params)

    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def order_params
    params.require(:order_delivery).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], order_id: params[:order_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_a08d6aaa8efd48dee9c37eff"  # 自身のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
