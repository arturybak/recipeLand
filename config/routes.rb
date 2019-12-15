Rails.application.routes.draw do

  #Skipping all, just for the mapping to get correctly added
  devise_for :users, skip: :all

  #Defining only necessary routes
  devise_scope :user do
    get 'users/sign_in', to: 'devise/sessions#new', as: :new_user_session
    post 'users/sign_in', to: 'devise/sessions#create', as: :user_session
    delete 'users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
    get 'users/sign_up', to: 'devise/registrations#new', as: :new_user_registration
    get 'users/cancel', to: 'devise/registrations#cancel', as: :cancel_user_registration
    delete 'users', to: 'devise/registrations#destroy', as: :user_registration
    post 'users', to: 'devise/registrations#create', :as => nil
    get 'users/password/new', to: 'devise/passwords#new', as: :new_user_password
  end


  resources :recipes do
    member do
      put "like" => "recipes#like"
    end
  end

  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'
  get '/search' => 'home#search', :as => 'search_page'

  root 'home#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
