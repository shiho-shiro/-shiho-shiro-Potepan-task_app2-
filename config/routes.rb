Rails.application.routes.draw do
  root 'home#top'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  devise_scope :users do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  get 'users/show'
  resources :rooms
  resources :reservations do
    collection do
     post :complete # 完了画面
    end
  end
end
