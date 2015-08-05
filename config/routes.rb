Rails.application.routes.draw do
  
  root 'welcome#index'
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'

end
