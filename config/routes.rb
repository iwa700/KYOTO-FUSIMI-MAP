Rails.application.routes.draw do
  
  
  devise_for :admins
  devise_for :customers
  get 'items/index'
  get 'items/show'
  
  scope module: :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
  end
  
  
 
  

end
