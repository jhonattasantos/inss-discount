
Rails.application.routes.draw do
  root 'home#index'
  resources :employees
  post 'calculate-contribution', to: 'employees#calculate_contribution'
  
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
