class Public::AddressesController < ApplicationController
  
  def index
    @address = Address.new
    @addresses = Address.all
  end
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    # 3. データをデータベースに保存するためのsaveメソッド
    address.save
    # 4. トップ画面へリダイレクト
    redirect_to '/addresses'
  end

  def edit
    @address = Address.find(params[:id])
    @addresses = Address.all
  end
  
  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path(address.id)  
  end
  
  def destroy
    address = Address.find(params[:id])  # データ（レコード）を1件取得
    address.destroy  # データ（レコード）を削除
    redirect_to addresses_path(address.id)   # 投稿一覧画面へリダイレクト  
  end
  
  private
  # ストロングパラメータ
  def address_params
    params.require(:address).permit(:postal_code, :name, :adress)
  end
end
