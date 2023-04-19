Rails.application.routes.draw do



 
  devise_for :users
  root to: 'homes#top'
  # ゲストログイン機能↓
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  resources:users, only:[:new, :index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources:stores, only:[:index, :show, :edit, :update]
  resources:beans, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  get 'searches' => 'searches#index'

end

