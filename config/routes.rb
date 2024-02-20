Rails.application.routes.draw do
  get 'public/items'
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about' => 'homes#about',as: 'public/homes/about'
    resources :orders,only: [:new, :create, :index, :show]
    resources :items,only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      delete :destroy_all, on: :collection
    end
    post 'orders/confirm'
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
    resources :genres,only: [:edit, :create, :index, :update]
    resources :orders,only: [:index, :show]
    resources :items,only: [:index, :new, :create, :show, :edit, :update]
  end

  namespace :public do
    get  '/publicers/check' => 'publicers#check'
    patch  '/publicers/withdraw' => 'publicers#withdraw'
    resources :publicers, only: [:show, :edit, :update]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm'
    get 'orders/thanks'
      root to: 'homes#top'
    get 'homes/about' => 'homes#about',as: 'public/homes/about'

  end
end
