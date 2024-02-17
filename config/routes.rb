Rails.application.routes.draw do



  devise_for :publics,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
  resources :genres,only: [:edit, :create, :index, :update]
  resources :orders,only: [:index, :show]
  end

  namespace :public do
    resources :orders,only: [:new, :create, :index, :show]
    post 'orders/confirm'
    get 'orders/thanks'
  end
end
