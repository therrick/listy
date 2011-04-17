Listy::Application.routes.draw do

  devise_for :users

  namespace :admin do
    resources :users
    resources :locations
    resources :items
    resources :stores
  end

  resources :stores do
    post :mark_all_purchased, :on => :member
    resources :locations do
      post :sort, :on => :collection
      post :move_up, :on => :member
    end
    resources :items do # TODO: these should be posts
      post :mark_purchased, :on => :member
      post :undo_purchase, :on => :member
      post :add_needed, :on => :member
      post :subtract_needed, :on => :member
    end
  end
  

  root :to => "stores#index"

end
