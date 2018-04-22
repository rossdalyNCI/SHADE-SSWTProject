Rails.application.routes.draw do
  get 'orderitems/index'

  get 'orderitems/show'

  get 'orderitems/new'

  get 'orderitems/edit'

  resources :orders do
    resources:orderitems
  end
  
  
  resources :categories
  
  
  
  devise_for :users do
    resources:orders
  end
  
  get '/checkout' , to: 'cart#createOrder'
  
  get '/paid' , to: 'static_pages#paid'
  
  post '/search', to: 'items#search'
  
  get 'cart/index'
  
  get '/cart', to: 'cart#index'

  resources :items
  root 'static_pages#home'

  

  get '/about', to: 'static_pages#about'
  
  get '/login', to: 'user#login'
  get '/logout', to: 'user#logout'
  
  get '/cart/clear', to: 'cart#clearCart'
  get '/cart/:id', to: 'cart#add'
  get '/cart/remove/:id', to: 'cart#remove'
  
  root :to => 'site#home'
  
  get 'category/:title', to: 'static_pages#category'
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
