Rails.application.routes.draw do
  get 'carts/index'

  devise_for :users
  root 'homes#index'
  resources :photos
  resources :carts
  resources :two_wheelers do
  	get :get_two_wheeler, on: :collection
  end
end
