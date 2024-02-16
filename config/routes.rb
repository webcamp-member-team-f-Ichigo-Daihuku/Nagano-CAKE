Rails.application.routes.draw do
  devise_for :publics,skip: [:passwords], controllers: {
  registrations: 'public/registrations',
  sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'homes/about' => 'homes#about',as: 'public/homes/about'
  end


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
namespace :admin do
  resources :genres,only: [:edit, :create, :index, :update]
end

end
