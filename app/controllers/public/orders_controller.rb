class Public::OrdersController < ApplicationController
  def index
    @order = Order.new
    @orders = Order.all
    
    # @order_detail = OrderDetail.new
    # @order_detail.order_id = @order_id
  end

  def new
    @order = Order.new
    @customer = current_customer
  end

  def show
   
    @order = Order.find(params[:id])  
    
  end
  
  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @orders = Order.all
    
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name 
    elsif 
      params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.adress
      @order.name = @address.name
    elsif 
      params[:order][:select_address] == "2"
    end
  end
  
  def complete
  
  end
  
  def create
   
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.status = 0
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @order.save
    
    current_customer.cart_items.each do |cart_item|
       @order_detail = OrderDetail.new
       @order_detail.item_id = cart_item.item_id
       @order_detail.amount = cart_item.amount
       @order_detail.price = cart_item.item.price
       @order_detail.order_id = @order.id
       @order_detail.create_status = 0
       @order_detail.save
    end 

    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    
    redirect_to '/orders/complete'
  end

  private
  
    def order_params
      params.require(:order).permit(:shipping_cost,:total_payment,:payment_method,:address, :postal_code,:name )
    end
    
end


