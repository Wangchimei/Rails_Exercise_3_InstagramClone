Rails.application.routes.draw do
  resources :feeds
  root to: 'feeds#index'
end
