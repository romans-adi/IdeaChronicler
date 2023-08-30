Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register'}

  devise_scope :user do
    root to: 'devise/sessions#new', as: :login
    get 'sign_in', to: 'devise/sessions#new'
    get 'registration', to: 'devise/registrations#new'
    get 'password', to: 'devise/passwords#new'
    get 'unlock', to: 'devise/unlocks#new'
    get 'verification', to 'devise/confirmations#new'
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
