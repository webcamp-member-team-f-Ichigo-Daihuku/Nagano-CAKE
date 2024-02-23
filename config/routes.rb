Rails.application.routes.draw do
  get 'public/items'
  post 'public/orders/confirm' => 'public/orders#confirm'
  get 'public/orders/confirm' => 'public/orders#miss'
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about' => 'homes#about',as: 'public/homes/about'

    resources :orders,only: [:new, :create, :index, :show]
    resources :items,only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      delete :destroy_all, on: :collection
    end

    get 'orders/thanks'
  end


  devise_for :publics,skip: [:passwords], controllers: {
  registrations: 'public/registrations',
  sessions: 'public/sessions'

  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :genres,only: [:edit, :create, :index, :update]
    resources :orders,only: [:index, :show, :update]
    resources :items,only: [:index, :new, :create, :show, :edit, :update]
    resources :publicers, only: [:index, :show, :edit, :update]
    resources :order_details, only: [:update]
  end

  namespace :public do
    get  '/publicers/check' => 'publicers#check'
    patch  '/publicers/withdraw' => 'publicers#withdraw'
    post 'orders/confirm'
    get 'orders/thanks'
    resources :publicers, only: [:show, :edit, :update]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    get 'orders/thanks'
    resources :orders, only: [:new, :create, :index, :show]
      root to: 'homes#top'
    get 'homes/about' => 'homes#about',as: 'public/homes/about'

  end
end
