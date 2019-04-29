Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  get 'dashboard', to: 'home#dashboard'

  post 'search_bank', to: 'banks#search'
  post 'create_bank', to: 'banks#create'

  resources :companies do
    resources :bank_accounts, shallow: true
  end
end
