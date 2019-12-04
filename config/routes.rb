Rails.application.routes.draw do
  devise_for :users
  resources :recipes

  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'
  get '/search' => 'home#search', :as => 'search_page'

  root 'home#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
