Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'payments/new'
  root to: 'payments#new'
  resources :articles
end
