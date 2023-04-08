Rails.application.routes.draw do

  get 'stores/index'
  get 'stores/show'
  get 'stores/index'
  devise_for :users
  root to: 'homes#top'
  resources:beans, only:[:new, :create, :index, :show, :edit, :update, :destroy]
  resources:stores, only:[:index, :show]


end
