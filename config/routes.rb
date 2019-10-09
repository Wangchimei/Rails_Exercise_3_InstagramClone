Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  resources :feeds do
    collection do 
      post :confirm
    end
  end
  
  resources :feeds do
    resources :comments, only: [:new, :create, :destroy]
  end

  resources :users
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :show, :destroy]
  
  root to: 'users#coverpage'
end
