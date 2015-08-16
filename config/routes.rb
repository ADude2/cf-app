Rails.application.routes.draw do
  
  devise_for :users
  root 'welcome#index'
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'

  resources :gyms, only: [:index, :show]

  resources :listrefreshes, only: [:index, :create]

end
