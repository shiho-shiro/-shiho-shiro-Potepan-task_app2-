Rails.application.routes.draw do
  root 'home#top'
  devise_for :users, controllers: { registrations: 'registrations' }, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  devise_scope :users do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  get 'users/show'
  resources :rooms do
    collection do
      get :search
    end
  end
  resources :reservations do
    collection do
     get :complete# 完了画面
    end
  end
end
