class Public::CustomersController < ApplicationController
  

  def show
   @customer=current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customer_path(customer.id)  
  end
  
  def unsubscribe
  end
  
  def withdrawal
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    sign_out_and_redirect(current_customer)
    flash[:notice] = "退会処理を実行いたしました"
  end
  
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number, :body)
  end
  
  
end
