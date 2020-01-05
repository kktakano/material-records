Rails.application.routes.draw do
  root 'items#index'
  devise_for :users

  resources :users, only: [:edit, :update]
  resources :items, only: [:new, :create, :edit, :update] do
    collection do
      get 'search'
      get 'item_search'
    end
  end
  resources :materials, only: [:index, :new, :create, :edit, :update, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
