Rails.application.routes.draw do
  
  get 'order_details/update'
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
    # get 'items/index'
    # get 'items/show'
  }
    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
    
  namespace :admin do
    patch 'genres' => 'genres#create' 
    resources :genres
  end
  
  namespace :admin do
    resources :orders
    resources :order_details
  end
  
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  
  namespace :admin do
    resources :items
    resources :customers
    get '/' => 'homes#top'
    post 'items' => 'items#create' 
    patch 'items/:id'=> 'items#show'
  end
  
  root 'public/homes#top'
  
  scope module: :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers/withdrawal' => 'customers#withdrawal'
    delete 'addresses/:id' => 'addresses#destroy'
    get 'orders/complete' => 'orders#complete'
    post 'orders/confirm' => 'orders#confirm'
    post 'orders/complete' => 'orders#complete'
    resources :genres
    resources :addresses
    resources :orders
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items 
    resources :items
    resources :customers
  end
end