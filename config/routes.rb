Rails.application.routes.draw do


  devise_for :users
  root to: 'homes#top'
  resources:users, only:[:new, :index, :show, :edit, :update]
  resources:stores, only:[:index, :show]
  resources:beans, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

end
