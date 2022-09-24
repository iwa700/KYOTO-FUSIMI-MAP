class Public::ItemsController < ApplicationController
  
  def index
    @item=Item.new
    @items = Item.all  
    @items_latest8 = @items.first(8)
    
  end

  def show
    @item=Item.find(params[:id])
    @items=Item.all
    @cart_item=CartItem.new

  end
  
  def edit
    

  end
  
  private
  def item_params
    params.require(:item).permit(:name, :price, :image)  
  end
end
