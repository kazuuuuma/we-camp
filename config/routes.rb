Rails.application.routes.draw do
  devise_for :users
  root to:"posts#index"
  resources :users do
    collection do
      get 'favorites'
    end
  end
  resources :posts do
    collection do
      get 'search'
    end
    resources :favorites, only: [:create, :destroy]
    collection do
      get :favorites
    end
    resources :reviews, only: :create
  end
  get 'posts/:id', to: 'review#create' 
end
