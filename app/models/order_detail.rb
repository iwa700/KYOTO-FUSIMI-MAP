class OrderDetail < ApplicationRecord
    
  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :price, presence: true
  
  belongs_to :item
  belongs_to :order
  

  enum create_status: { cant_creation: 0, waiting_creation: 1, ing: 2, created: 3 }
end
