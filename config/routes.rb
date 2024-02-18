Rails.application.routes.draw do
  devise_for :publics,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  namespace :public do
    # 退会確認画面
    get  '/publicers/check' => 'publicers#check'
    # 論理削除用のルーティング
    patch  '/publicers/withdraw' => 'publicers#withdraw'
    # get 'publicers/my_page'
    resources :publicers, only: [:show, :edit, :update]
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :genres,only: [:edit, :create, :index, :update]
  end

end
