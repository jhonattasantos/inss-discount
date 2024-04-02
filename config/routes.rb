Rails.application.routes.draw do
  root 'home#index'
  resources :employees
  post 'calculate-contribution', to: 'employees#calculate_contribution'
end
