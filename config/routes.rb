Rails.application.routes.draw do
  
  devise_for :users
  root 'welcome#index'
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'

  resources :gyms, only: [:index, :show] do
    resources :reviews
  end

  resources :listrefreshes, only: [:index, :create]
  resources :gymrefreshes, only: [:index, :create]
end
