Rails.application.routes.draw do


  devise_for :users
  root to: 'homes#top'
  resources:users, only:[:new, :index, :show, :edit, :update]
  resources:beans, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
   resource :favorites, only: [:create, :destroy]
  end
  resources:stores, only:[:index, :show]


end
