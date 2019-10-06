Rails.application.routes.draw do
  resources :feeds do
    collection do 
      post :confirm
    end
  end
  
  resources :users, only: [:new, :create, :edit, :update, :show]
  
  root to: 'users#welcome'
end
