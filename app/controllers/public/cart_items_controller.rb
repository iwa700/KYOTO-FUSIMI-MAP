class Public::CartItemsController < ApplicationController
  def index
    @cart_item=CartItem.new
    @cart_items=current_customer.cart_items
    @sum_cart_item=0
  end
  
  def create
    
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    cart_items = CartItem.new(cart_items_params)
    cart_items.customer_id = current_customer.id
  # 　binding.pry#   b3. データをデータベースに保存するためのsaveメソッド実行
    cart_items.save
    # 4. トップ画面へリダイレクト
    redirect_to cart_items_path
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])  # データ（レコード）を1件取得
    cart_item.destroy  # データ（レコード）を削除
    redirect_to cart_items_path  # 投稿一覧画面へリダイレクト  
  
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all   # データ（レコード）を1件取得
    redirect_to cart_items_path  # 
    
    # cart_items.customer_id = current_customer.id
    # CartItem.destroy_all
    # redirect_to cart_items_path
  end
  
  
  def update
    amount = CartItem.find(params[:id])
    amount.update(cart_items_params)
    redirect_to cart_items_path 
  end
  
  
  private
  # ストロングパラメータ
  def cart_items_params
    params.require(:cart_item).permit(:amount, :item_id,:customer_id)
  end
  
end
