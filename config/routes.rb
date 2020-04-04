Rails.application.routes.draw do

  root 'home#top'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:show,  :new, :edit, :update] do
    member do
      get :following, :followers
    end
  end

  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]

end
