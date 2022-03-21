require 'sidekiq/web'
Rails.application.routes.draw do
  get 'pages/homepage'
  root to: "timesheets#index"
  resources :timesheets

  mount Sidekiq::Web => '/sidekiq'  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
