Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:show]

  root 'welcome#index'
  get 'about' => 'welcome#about'

  resources :gyms, only: [:index, :show] do
    resources :reviews, except: [:index, :show]
  end

  resources :listrefreshes, only: [:index, :create]
  resources :gymrefreshes, only: [:index, :create]
  resources :massgymimports, only: [:index, :create]
  resources :messages, only: [:new, :create]

  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

end
