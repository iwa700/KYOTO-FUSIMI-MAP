class Admin::ItemsController < ApplicationController
    def index
      @items = Item.all 
      @item = Item.new
    end
    
    def new
      @item = Item.new
      
    end
    
    def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
      item = Item.new(item_params)
      # 3. データをデータベースに保存するためのsaveメソッド実行
      item.save
      # 4. トップ画面へリダイレクト
      redirect_to admin_item_path(item.id)
    end
    
    def show
      @item_new=Item.new
      @item=Item.find(params[:id])
    end
    
    def edit
      @item_new=Item.new
      @item=Item.find(params[:id])
    end
    
    def update
      item = Item.find(params[:id])
      item.update(item_params)
      redirect_to admin_item_path(item.id)  
    end
    
    private
  # ストロングパラメータ
    def item_params
      params.require(:item).permit(:last_name, :first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:is_deleted,:image, :name, :introduction, :genre_id, :price, :is_active)
    end
end
