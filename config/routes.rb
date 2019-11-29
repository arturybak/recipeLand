Rails.application.routes.draw do
  devise_for :users
  resources :recipes

  root 'recipes#index'
  get 'contact', to: 'contact#contact'

  post 'request_contact', to: 'contact#request_contact'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
