Rails.application.routes.draw do

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
    resources :publicers, only: [:index, :show, :edit, :update]
  end

  namespace :public do
    get  '/publicers/check' => 'publicers#check'
    patch  '/publicers/withdraw' => 'publicers#withdraw'
    resources :publicers, only: [:show, :edit, :update]
    resources :orders,only: [:new, :create, :index, :show]
    post 'orders/confirm'
    get 'orders/thanks'
      root to: 'homes#top'
    get 'homes/about' => 'homes#about',as: 'public/homes/about'

  end
end
