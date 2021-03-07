Rails.application.routes.draw do
  devise_for :users
  root to:"posts#index"
  resources :users do
    #collection do
     # get 'favorites'
    #end
  end
  resources :posts do
    collection do
      get 'search'
      get 'maps'
      get 'prefecture'
    end
    #collection do
     # get 'favorites'
    #end
    resources :favorites, only: [:create, :destroy, :index]
    resources :reviews, only: [:create, :destroy]
  end
  #get 'posts/:id', to: 'review#create' 
  #get 'posts/;id', to: 'favorites#create'
end
