Rails.application.routes.draw do

  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'stores/index'
  get 'stores/show'
  get 'stores/index'
  devise_for :users
  root to: 'homes#top'
  resources:users, only:[:new, :index, :show, :edit, :update]
  resources:beans, only:[:new, :create, :index, :show, :edit, :update, :destroy]
  resources:stores, only:[:index, :show]


end
