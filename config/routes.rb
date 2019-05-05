Rails.application.routes.draw do
  root 'home#index'
  devise_for :accounts

  get 'dashboard', to: 'home#dashboard'

  post 'search_bank', to: 'banks#search'
  post 'create_bank', to: 'banks#create'

  resources :companies do
    resources :bank_accounts, shallow: true
  end
end
