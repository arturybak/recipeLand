Rails.application.routes.draw do
  get 'home/home'
  get 'home/contact'
  devise_for :users
  resources :recipes

  root 'recipes#index'
  get 'contact', to: 'home#contact'

  post 'request_contact', to: 'home#request_contact'

  mount Commontator::Engine => '/commontator'

  get '/search' => 'home#search', :as => 'search_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
