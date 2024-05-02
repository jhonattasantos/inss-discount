
Rails.application.routes.draw do
  devise_for :users
  root 'employees#index'
  resources :employees
  post 'calculate-contribution', to: 'employees#calculate_contribution'
  get 'salary-ranges-report', to: 'employees#salary_ranges_report'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
